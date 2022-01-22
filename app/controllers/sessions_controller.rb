class SessionsController < ApplicationController
    attr_accessor :user
    def new

    end

    def create
        # binding.pry
        @user = User.find_by(email: params[:email].downcase)
        p @user
        if @user && @user.authenticate(params[:password])
            # binding.pry
            session[:id] = @user.id
            cookies[:id] = @user.id
            p 'login test success'
            flash[:notice] = "Logged in successfully"
            render :json => {message: "logged in successfully"}
        else
            flash.now[:alert] = "There was something wrong with your login credentials"
            render :json => {message: "There was something wrong with your credentials"}
        end
        # binding.pry
    end

    def destroy
        # redirect_to root_path
        # binding.pry
        if !!session[:id]
            flash[:notice] = "Logged out"
            session[:id] = nil
            render :json => {message: "logged out successfully"}
      
        else
            render :json => {message: "you are not a logged in user"}
        end
    end
end