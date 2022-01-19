class UserResource < JSONAPI::Resource
    has_many :articles, dependent: :destroy
    attributes :username, :email, :password
end