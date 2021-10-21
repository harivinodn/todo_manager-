Rails.application.routes.draw do

  get "/" => "home#index"
  post "users/login", to: "users#login"
  resources :todos # creates seven different routes
  resources :users


end
