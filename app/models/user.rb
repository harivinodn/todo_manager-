require 'active_record'

class User < ApplicationRecord
  has_secure_password
  has_many :todos

  def to_pleasent_string
    "#{id}. #{first_name}, #{email}, #{password}"
  end

end
