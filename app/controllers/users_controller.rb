class UsersController < ApplicationController
    
    # before_action :set_user, only: [:show, :edit, :update, :destroy]
    # before_action :require_user, only: [:edit, :update]
    # before_action :require_same_user, only: [:edit, :update, :destroy]
    # def index
    #     @users = User.all
    # end

    # def show
       
    #     @articles = @user.articles
    # end

    # def new
    #     @user = User.new
    # end

    # def edit
       
    # end

    # def update
        
    #     if @user.update(user_params)
    #         flash[:notice] = "Your account information was successfully updated"
    #         redirect_to @user
    #     else
    #         render 'edit'
    #     end
        
    # end

    # def create
    #     @user = User.new(user_params)
    #     if @user.save
    #         session[:id] = @user.id
    #         flash[:notice] = "welcome to Alpha blog, sign up sccessful"
    #         redirect_to articles_path
    #     else
    #         render 'new'
    #     end
    # end

    # def destroy
    #     @user.destroy
    #     if current_user.admin? 
    #         flash[:notice] = "Account and all asociated articles successfully deleted"
    #     else
    #         session[:id] = nil
    #     end
    #     redirect_to articles_path
    # end

    # private

    # def user_params
    #     params.require(:user).permit(:username, :email, :password)
    # end

    # def set_user
    #     @user = User.find(params[:id])
    # end

    # def require_same_user
    #     if current_user != @user && !current_user.admin?
    #         flash[:alert] = "You can only edit or delete your own profile"
    #         redirect_to @user
    #     end
    # end
    # before_action :authorize_user
    # before_action :current_user
    def destroy
        @user = User.find(params[:id])
        # binding.pry
        authorize current_user
        if @user.destroy 
            render :json => {message: "deleted user"}
        else
            render :json => {message: "you don't have previliges to delete the user"}
        end
    end
end