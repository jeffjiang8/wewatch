class CommentsController < ApplicationController
    def new
        @comment = Comment.new
    end

    def create
        if params[:comment][:comment] != ""
            @comment = Comment.create(comment_params) 
            redirect_to episode_path(params[:comment][:episode_id])
        end
    end

    def edit
        @comment = Comment.find(params[:id])
    end

    def update
        if params[:comment][:comment] != ""
            @comment = Comment.find(params[:id])
            @comment.update(comment_params) 
            @episode = @comment.episode
            redirect_to episode_path(@episode)
        end
    end


    private

    def comment_params
        params.require(:comment).permit(:user_id, :episode_id, :comment)
    end
end
