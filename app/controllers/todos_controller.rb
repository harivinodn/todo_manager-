# todos_controller.rb
class TodosController < ApplicationController
  def index
    #render plain: Todo.all.to_a
    #render plain:Todo.all.map{ |todo| todo.to_pleasent_string }.join("\n")
    render plain:Todo.order(:due_date).map{ |todo| todo.to_pleasent_string }.join("\n")
  end
end
