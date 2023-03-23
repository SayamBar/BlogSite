Rails.application.routes.draw do
  devise_for :users
  get 'homes/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
  get 'posts/new', to:"posts#new"
  get 'posts', to:"posts#index"
  post 'posts', to:"posts#create"
  get '/posts/:id', to:"posts#show", as:'post'
  get 'posts/:id/edit', to:"posts#edit", as:'edit'
  patch 'posts/:id', to:"posts#update"
  delete 'posts/:id', to:"posts#destroy", as:'destroy'

  get 'users/:id', to:"users#show", as:"profile"
  namespace :api do
    namespace :v1 do
      resources :posts
    end
  end
  
end
