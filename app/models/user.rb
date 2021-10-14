require 'active_record'

class User < ApplicationRecord

  def to_pleasent_string
    "#{id}. #{name}, #{email}, #{password}"
  end

end
