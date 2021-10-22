Rails.application.routes.draw do

  get "/" => "home#index"
  post "users/login", to: "users#login"
  resources :todos # creates seven different s
  resources :users

  # get "/signin" => "sessions#new", as: :sessions
  # post "/signin" => "sessions#create", as: :sessions

  get "/signin" => "sessions#new", as: "new_sessions"
  post "/signin" => "sessions#create", as: "sessions"

end
