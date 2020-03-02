class TMDBApi
    require 'open-uri'
    require 'json'
    def self.all_the_season_info(id)
        @show = Show.find(id)
        tmdb_api_key = ENV["TMDB_API_KEY"]

        open("https://api.themoviedb.org/3/tv/#{id}?api_key=#{tmdb_api_key}&language=en-US") do |publications|
            publications.read.each_line do |publication|
                @item = JSON.parse(publication)
                @show.update(num_of_seasons: @item["number_of_seasons"])
            end
        end

        @show.num_of_seasons.times do |season|
            @season_num = season + 1
            open("https://api.themoviedb.org/3/tv/#{id}/season/#{@season_num}?api_key=#{tmdb_api_key}&language=en-US") do |publications|
                data = []
                publications.read.each_line do |publication|
                    @item = JSON.parse(publication)
                    object = {
                        "id": @item["id"],
                        "show_id": @show.id,
                        "name": @item["name"],
                        "episode_count": @item["episodes"].count,
                        "overview": @item["overview"],
                        "season_number": @season_num
                    }
                    data << object
                end
                Season.create!(data)
            end
        end

    end

    def self.all_the_episodes_info(id)
        @season = Season.find(id)
        tmdb_api_key = ENV["TMDB_API_KEY"]

        @season.episode_count.times do |episode|
            open("https://api.themoviedb.org/3/tv/#{@season.show_id}/season/#{@season.season_number}/episode/#{episode+1}?api_key=#{tmdb_api_key}&language=en-US") do |publications|
                data = []
                publications.read.each_line do |publication|
                    @item = JSON.parse(publication)
                    object = {
                        "id": @item["id"],
                        "season_id": @season.id,
                        "name": @item["name"],
                        "air_date": @item["air_date"],
                        "overview": @item["overview"],
                        "episode_number": episode+1

                    }
                    data << object
                end
                Episode.create!(data)
            end
        end
    end



end # end of api