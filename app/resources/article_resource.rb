class ArticleResource < JSONAPI::Resource
    has_one :user
    has_many :article_categories
    has_many :categories, through: :article_categories
end