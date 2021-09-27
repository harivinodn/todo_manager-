class Todo <ActiveRecord::Base
  def index
    render plain: Todo.all.to_a
  end
end
