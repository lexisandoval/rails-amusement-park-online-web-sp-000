class UsersController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]

    def new 
        @user = User.new
    end 

    def create
        @user = User.create(user_params)
        if @user && @user.authenticate(params[:user][:password])
            @user.save 
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else 
            redirect_to root_path 
        end 
    end 

    def show 
        @user = User.find_by(params[:id])
    end 
         
    private 
    
    def user_params
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end 
end
