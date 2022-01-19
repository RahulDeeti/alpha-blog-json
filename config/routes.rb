Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  # resources :articles #, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  # ##post 'users', to: 'users#create' 
  # resources :users

  # resources :categories, except: [:destroy]

  jsonapi_resources :articles
  jsonapi_resources :article_categories
  jsonapi_resources :users
  jsonapi_resources :categories
  
end
