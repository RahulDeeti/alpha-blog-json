class ApplicationController < ActionController::Base
    include JSONAPI::ActsAsResourceController
    skip_before_action :verify_authenticity_token
    # protect_from_forgery with: :null_session
    helper_method :current_user, :logged_in?
    include Pundit
    def current_user
        # binding.pry
        if session[:id]
            @current_user ||= User.find(session[:id])
        else
            render :json => {message: "you are not logged in"}
        end
    end

    def logged_in?
        !!@current_user
    end

    def require_user
        if !logged_in?
            flash[:alert] = "You must be logged in to perform that action"
            #redirect_to login_path
        end
    end
end
