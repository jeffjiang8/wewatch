class EpisodesController < ApplicationController
    def show
        @episode = Episode.find(params[:id])
        @comments = @episode.comments
        @show = @episode.season.show
        @views = View.all
        @watch = Watch.find_or_create_by(user_id: session[:user_id], episode_id: @episode.id)
        @image_path = @episode.season.show.poster_path
    end
end 