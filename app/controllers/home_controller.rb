class HomeController < ApplicationController
  def index
    @current_user_id = session[:current_user_id]
    render "index"
  end
end
