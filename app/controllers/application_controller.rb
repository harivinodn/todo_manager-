class ApplicationController < ActionController::Base

  def current_user
    current_user_id = session[:current_user_id]
    if current_user_id
      User.find(current_user_id)
    else
      nil
    end
  end

end
