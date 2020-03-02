class FollowingsController < ApplicationController
    def create
        Following.create!(user_id: session[:user_id],followed_user_id: params[:followee_id])
        redirect_to user_path(params[:followee_id])
    end

    def destroy
        @following = Following.find_by(user_id: session[:user_id],followed_user_id: params[:followee_id])
        @following.destroy
        redirect_to user_path(params[:followee_id])
    end

end