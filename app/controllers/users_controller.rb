# users_controller.rb

class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    render "user/new"
  end



  def index
    render plain: User.all.map{ |user| user.to_pleasent_string }.join("\n")
  end

  def show
    id = params[:id]
    user = User.find(id)
    render plain: user.to_pleasent_string
  end

  def create
    new_user = User.create!(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email_id],
      password_digest: params[:password_digest]
    )

    # name = params[:name]
    # email = params[:email]
    # password = params[:password]
    # new_user = User.create!(
    #   name: name,
    #   email: email,
    #   password: password
    # )
    # response_text = "Hey new user is created with id #{new_user.id}"
    # render plain: response_text
    redirect_to  "/"
  end

  def login
    email = params[:email]
    password = params[:password]
    user = User.find_by(email: email, password: password)
    render plain: user.present?
  end

end
