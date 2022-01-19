class ArticleCategoryResource < JSONAPI::Resource
    has_one :article
    has_one :category 
end