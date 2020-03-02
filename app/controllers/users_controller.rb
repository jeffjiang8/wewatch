class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :signin]

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Your Account Has Been Created Successfully!"
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:notice] = "Please Try Again"
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def show
        # byebug
        @sorted_comments = @user.comments.sort_by{|comment| comment.created_at}.reverse
    end

    def edit
        @user = User.find(params[:id])
        if @user.id != session[:user_id]
            redirect_to user_path(@user)
        end
    end

    def update
        @user.update(user_params)

        if @user.save
            flash[:notice] = "Your Information Has Been Saved!"
            redirect_to user_path
        else
            flash[:notice] = "Please Try Again"
            redirect_to new_user_path
        end
    end


    private
    
    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(
            :user_name,
            :first_name,
            :last_name,
            :age,
            :password,
            :password_confirmation,
            :phone_number
        )
    end 
end
