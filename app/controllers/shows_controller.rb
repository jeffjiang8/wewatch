class ShowsController < ApplicationController
    def index
        @shows = if params[:q] != nil
            Show.search_shows(params[:q])
         else
            Show.all.sort_by{ |show| show.created_at }
         end

        @check_out = Show.check_out
    end

    def show 
        in_database = Show.find(params[:id])
        TMDBApi.all_the_season_info(params[:id]) if !in_database.num_of_seasons
        @show = Show.find(params[:id])
        if @show.views.find{|view| view.user_id == session[:user_id]}
            @view = @show.views.find{|view| view.user_id == session[:user_id]}
        else
            @view = View.new
        end
        @seasons = @show.seasons.sort_by{ |show| show.season_number }.reverse
        @image_path  = @show.poster_path
    end

   
end
 