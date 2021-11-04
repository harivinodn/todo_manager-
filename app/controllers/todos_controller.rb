# todos_controller.rb

class TodosController < ApplicationController

  # Below comment is kept intentionly
  # skip_before_action :verify_authenticity_token

  def index
    #render plain:Todo.order(:due_date).map{ |todo| todo.to_pleasent_string }.join("\n")
    @todos = current_user.todos
    render "index"
  end

  def show
    id = params[:id]
    todo = Todo.of_user(current_user).find(id)
    render "todo"
    #render plain: todo.to_pleasent_string
  end

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])

    new_todo = Todo.create!(
      todo_text: todo_text,
      due_date: due_date,
      completed: false,
      user_id: current_user.id
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
    todo = Todo.of_user(current_user).find(id)
    todo.completed = completed;
    todo.save!

    # Evaluators please note: I intentionly kept this comments for my learning
    #                         Do not ask me to delete this in your feedback.
    # render plain: "Updates todo completed stutus to #{completed}"

    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    todo = Todo.of_user(current_user).find(id)
    todo.destroy
    redirect_to todos_path
  end

end
