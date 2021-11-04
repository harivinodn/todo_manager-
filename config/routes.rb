Rails.application.routes.draw do

  get "/" => "home#index"
  post "users/login", to: "users#login"
  resources :todos # creates seven different resources
  resources :users

  get "/signin" => "sessions#new", as: "new_sessions"
  post "/signin" => "sessions#create", as: "sessions"
  delete "/signout" => "sessions#destroy", as: "destroy_session"

end
