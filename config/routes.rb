Rails.application.routes.draw do
  devise_for :users
  get 'homes/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "homes#index"
  get 'posts/new', to:"posts#new"
  get 'posts', to:"posts#index"
  post 'posts', to:"posts#create"
end
