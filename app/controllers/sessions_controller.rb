class SessionsController < ApplicationController

  def new
    render "sessions/new"
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      render plain: "You have entered the correct password"
    else
      render plain: "You have enetered the incorrect password"
    end
  end

end
