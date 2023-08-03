Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users
  resources :posts, only: [:new, :create, :index]
  # Defines the root path route ("/")
  root "posts#index"
end
