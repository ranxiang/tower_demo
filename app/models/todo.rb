class Todo < ApplicationRecord
  belongs_to :project, optional: true
  belongs_to :creator, class_name: "User", optional: true
  belongs_to :assignee, class_name: "User", optional: true
  has_many :comments

  after_create :event_callback_for_todo_create
  before_update :event_callback_for_todo_delete,
    if: Proc.new { |todo| todo.deleted_changed?(from: false, to: true) }
  before_update :event_callback_for_todo_finished,
    if: Proc.new { |todo| todo.finished_changed?(from: false, to: true) }
  before_update :event_callback_for_todo_change_assignee,
    if: Proc.new { |todo| todo.assignee_id_changed? }

  def event_callback_for_todo_create
    Event.create_by_event_type_and_obj!(:todo_create, self)
  end

  def event_callback_for_todo_delete
    Event.create_by_event_type_and_obj!(:todo_delete, self)
  end

  def event_callback_for_todo_finished
    Event.create_by_event_type_and_obj!(:todo_finished, self)
  end

  def event_callback_for_todo_change_assignee
    Event.create_by_event_type_and_obj!(:todo_change_assignee, self)
  end

  before_update :event_callback_for_todo_change_finished_at,
    if: Proc.new { |todo| todo.finished_at_changed? }

  def event_callback_for_todo_change_finished_at
    Event.create_by_event_type_and_obj!(:todo_change_finished_at, self)
  end
end
