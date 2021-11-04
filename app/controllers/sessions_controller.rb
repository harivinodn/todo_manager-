class SessionsController < ApplicationController

  skip_before_action :ensure_user_logged_in

  def new
    render "sessions/new"
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      #render plain: "You have entered the correct password"
      redirect_to todos_path  # or redirect_to "/"
    else
      render plain: "You have enetered the incorrect password"
    end
  end

  def destroy
    session[:current_user_id] = nil
    @current_user =nil
    redirect_to "/"
  end


end
