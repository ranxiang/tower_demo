require 'rails_helper'

RSpec.describe Todo, type: :model do
  it "triggers event_callback_for_todo_create on create" do
    todo= Todo.new
    expect(todo).to receive(:event_callback_for_todo_create)
    todo.save
  end

  it "triggers event_callback_for_todo_delete on delete" do
    todo = Todo.create!(deleted: false, creator: User.create!, project: Project.create!)
    expect(todo).to receive(:event_callback_for_todo_delete)
    todo.deleted = true
    todo.save
  end

  it "triggers event_callback_for_todo_finished on update for set finished to true" do
    todo = Todo.create!(finished: false, creator: User.create!, project: Project.create!)
    expect(todo).to receive(:event_callback_for_todo_finished)
    todo.finished = true
    todo.save
  end

  it "triggers event_callback_for_todo_change_assignee on update for change assignee" do
    todo = Todo.create!(finished: false, creator: User.create!, project: Project.create!)
    expect(todo).to receive(:event_callback_for_todo_change_assignee)
    todo.assignee = User.create!
    todo.save
  end

  it "triggers event_callback_for_todo_change_finished_at on update for change finished_at" do
    todo = Todo.create!(creator: User.create!, project: Project.create!)
    expect(todo).to receive(:event_callback_for_todo_change_finished_at)
    todo.finished_at = DateTime.now
    todo.save
  end
end
