class ArticlePolicy < ApplicationPolicy
    attr_reader :user

    def initialize(user, record)
      @user = user
    end

    def destroy?
        @user.admin
    end
    
end