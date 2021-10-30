class HomeController < ApplicationController
  def index
    @current_user_id = session[:current_user_id]
    render "index", locals: { user_name: current_user.first_name}
  end
end
