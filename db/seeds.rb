# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

tmdb_api_key = ENV["TMDB_API_KEY"]

# Season.delete_all
# Episode.delete_all
# Show.delete_all
40.times do |i|
   open("https://api.themoviedb.org/3/tv/popular?api_key=#{tmdb_api_key}&language=en-US&page=#{i+201}") do |publications|
        data = []
        publications.read.each_line do |publication|
            @item = JSON.parse(publication)
            @item["results"].each do |result|
                object = {
                    "id": result["id"],
                    "name": result["name"],
                    "vote_avg": result["vote_average"],
                    "overview": result["overview"],
                    "poster_path": result["backdrop_path"]
                }
                data << object
            end
        end
        Show.create!(data)
    end
end

# Show.all.limit(40).each do |show|
#     open("https://api.themoviedb.org/3/tv/#{show.id}?api_key=#{tmdb_api_key}&language=en-US") do |publications|
#         publications.read.each_line do |publication|
#             @item = JSON.parse(publication)
#             show.update(num_of_seasons: @item["number_of_seasons"])
#         end
#     end
# end

# Show.all.limit(1).each do |show|
#     iter_times = show.num_of_seasons
#     iter_times.times do |season|
#         open("https://api.themoviedb.org/3/tv/#{show.id}/season/#{season}?api_key=#{tmdb_api_key}&language=en-US") do |publications|
#             data = []
#             publications.read.each_line do |publication|
#                 @item = JSON.parse(publication)
#                 object = {
#                     "id": @item["id"],
#                     "show_id": show.id,
#                     "name": @item["name"],
#                     "episode_count": @item["episodes"].count,
#                     "poster_path": @item["poster_path"],
#                     "overview": @item["overview"]

#                 }
#                 data << object
#             end
#             Season.create!(data)
#         end
#     end
# end

# Season.all.limit(1).each do |season|
#     season.episode_count.times do |episode|
#         open("https://api.themoviedb.org/3/tv/#{season.show_id}/season/1/episode/#{episode+1}?api_key=#{tmdb_api_key}&language=en-US") do |publications|
#             data = []
#             publications.read.each_line do |publication|
#                 @item = JSON.parse(publication)
#                 object = {
#                     "id": @item["id"],
#                     "season_id": season.id,
#                     "name": @item["name"],
#                     "air_date": @item["air_date"],
#                     "overview": @item["overview"]

#                 }
#                 data << object
#             end
#             Episode.create!(data)
#         end
#     end
# end

