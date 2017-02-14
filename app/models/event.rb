class Event < ApplicationRecord
  belongs_to :user
  belongs_to :project
  enum event_type: { todo_create: 1,
                     todo_delete: 2,
                     todo_finished: 3,
                     todo_change_assignee: 4,
                     todo_change_finished_at: 5,
                     comment_create: 6}
  serialize :ext_data, Hash

  def self.create_by_event_type_and_obj!(event_type, obj)
    event = Event.new
    event.user = obj.creator
    event.project = obj.project
    event.event_type = event_type
    event.ext_data = Event.generate_ext_data(event_type, obj)
    event.save!
  end

  def self.generate_ext_data(event_type, obj)
    case event_type
    when :todo_create
      {todo_id: obj.id, todo_title: obj.title}
    when :todo_delete
      {todo_id: obj.id, todo_title: obj.title}
    when :todo_finished
      {todo_id: obj.id, todo_title: obj.title, todo_finished_at: obj.finished_at}
    when :todo_change_assignee
      {todo_id: obj.id, todo_title: obj.title, assignee_id_was: obj.assignee_id_was, assignee_id: obj.assignee_id}
    when :todo_change_finished_at
      {todo_id: obj.id, todo_title: obj.title, finished_at_was: obj.finished_at_was, finished_at: obj.finished_at}
    when :comment_create
      {comment_id: obj.id, comment_content: obj.content, todo_id: obj.todo.id, todo_title: obj.todo.title}
    else
      # FIXME, handle error here.
    end
  end
end
