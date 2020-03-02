class WatchesController < ApplicationController
    def edit
        @watch = Watch.find(params[:id])
    end

    def update
        @watch = Watch.find(params[:id])
        @watch.update(watched: params[:watch][:watched])
    end

    private

    def watch_params
        params.require(:watch).permit(:user_id, :episode_id, :watched)
    end
end
