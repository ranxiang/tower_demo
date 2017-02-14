class Comment < ApplicationRecord
  belongs_to :todo, optional: true
  belongs_to :user, optional: true

  after_create :event_callback_for_comment_create

  def creator
    user
  end

  def project
    todo.project
  end

  def event_callback_for_comment_create
    Event.create_by_event_type_and_obj!(:comment_create, self)
  end
end
