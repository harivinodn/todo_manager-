
class UsersController < ApplicationController

  skip_before_action :ensure_user_logged_in

  # # Use below code to list all users using  http://localhost:3000/users/index
  # def index
  #   render plain: User.all.map{ |user| user.to_pleasent_string }.join("\n")
  # end

  # # Use below to list user details given "id" using  http://localhost:3000/users/id
  # def show
  #   id = params[:id]
  #   user = User.find(id)
  #   render plain: user.to_pleasent_string
  # end

  def new
    render "/user/new"
  end

  def create
    new_user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password]
    )

    if new_user.save
      session[:current_user_id] = new_user.id
      redirect_to todos_path
    else
      flash[:error] = new_user.errors.full_messages.join(", ")
      redirect_to "/users/new"
    end

  end

end
