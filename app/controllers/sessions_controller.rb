class SessionsController < ApplicationController
    def new

    end

    def create
        byebug
        user = User.find_by(email: params[:email].downcase)
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            flash[:notice] = "Logged in successfully"
            # redirect_to user
            render :json => user
        else
            flash.now[:alert] = "There was something wrong with your login credentials"
            render :json => {message: "There was something wrong with your credentials"}
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logged out"
        # redirect_to root_path
        render :json => {message: "logged out successfully"}
    end
end