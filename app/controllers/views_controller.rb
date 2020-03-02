class ViewsController < ApplicationController
    def new
        @view = View.new
    end

    def create
        @view = View.create(view_params)
        redirect_to show_path(params[:view][:show_id])
    end

    def edit
        @view = View.find(params[:id])
    end

    def update
        @view = View.find(params[:id])
        @view.update(status: params[:view][:status])
        redirect_to show_path(params[:view][:show_id])
    end

    private

    def view_params
        params.require(:view).permit(:user_id, :show_id, :status)
    end
end
