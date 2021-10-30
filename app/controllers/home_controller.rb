class HomeController < ApplicationController
  def index
    if current_user
      redirect_to todos_path
    else
      #@current_user_id = session[:current_user_id]
      #render "index", locals: { user_name: current_user.first_name}
      render "index"
    end
  end
end
