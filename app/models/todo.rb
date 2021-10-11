class Todo <ActiveRecord::Base

  # def to_pleasent_string
  #   is_completed = completed ? "[X]" : "[ ]"
  #   "#{id}. #{is_completed} #{todo_text}, #{due_date}"
  # end

  def self.overdue
    where("due_date < ? and (not completed)", Date.today)
  end

  def self.duelater
    all.where("due_date > ?", Date.today)
  end

  def self.duetoday
    all.where("due_date = ?", Date.today)
  end

  def self.completed
    all.where(completed: true)
  end


end
