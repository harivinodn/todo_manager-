require 'active_record'

class User < ApplicationRecord
  has_many :todos

  def to_pleasent_string
    "#{id}. #{name}, #{email}, #{password}"
  end

end
