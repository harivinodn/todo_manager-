class Todo <ActiveRecord::Base
  validates :todo_text, presence: true
  validates :todo_text, length: {minimum: 2}
  validates :due_date, presence: true

  belongs_to :user
    # Below conditions need to met while writing above code
    # Table called "users"
    # todos table will contain "user_id"

  # def to_pleasent_string
  #   is_completed = completed ? "[X]" : "[ ]"
  #   "#{id}. #{is_completed} #{todo_text}, #{due_date}"
  # end

  def self.overdue
    where("due_date < ? and (not completed)", Date.today)
  end

  def self.of_user(user)
    all.where(user_id: user.id)
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
