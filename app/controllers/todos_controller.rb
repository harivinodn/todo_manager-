# todos_controller.rb

class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    #render plain:Todo.order(:due_date).map{ |todo| todo.to_pleasent_string }.join("\n")
    render "index"
  end

  def show
    id = params[:id]
    todo = Todo.find(id)
    render plain: todo.to_pleasent_string
  end

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])

    new_todo = Todo.create!(
      todo_text: todo_text,
      due_date: due_date,
      completed: false
    )

    # Evaluators please note: I intentionly kept this comments for my learning
    #                         Do not ask me to delete this in your feedback.
    #response_text = "Hey new todo is created with id #{new_todo.id}"
    #render plain: response_text

    redirect_to todos_path
  end

  def update
    id = params[:id]
    completed = params[:completed]
    todo = Todo.find(id)
    todo.completed = completed;
    todo.save!
    render plain: "Updates todo completed stutus to #{completed}"
  end

end
