require 'rails_helper'

RSpec.describe Event, type: :model do
  it "has valid ext data for type todo_create" do
    title = "todo title"
    todo = Todo.create!(title: title, creator: User.create!, project: Project.create!)
    expect(Event.generate_ext_data(:todo_create, todo)).to eq({todo_id: todo.id, todo_title: title})
  end

  it "has valid ext data for type todo_delete" do
    title = "todo title"
    todo = Todo.create!(title: title, creator: User.create!, project: Project.create!)
    expect(Event.generate_ext_data(:todo_delete, todo)).to eq({todo_id: todo.id, todo_title: title})
  end

  it "has valid ext data for type todo_finished" do
    title = "todo title"
    finished_at = Time.zone.local(2017, 2, 10, 15, 30, 45)
    todo = Todo.create!(title: title, creator: User.create!, project: Project.create!, finished_at: finished_at)
    expect(Event.generate_ext_data(:todo_finished, todo)).to eq({todo_id: todo.id, todo_title: title, todo_finished_at: finished_at})
  end

  it "has valid ext data for type todo_change_assignee" do
    title = "todo title"
    user_a = User.create!(name: "User A")
    user_b = User.create!(name: "User B")
    todo = Todo.create!(title: title, creator: user_a, project: Project.create!, assignee: user_a)
    todo.assignee = user_b
    expect(Event.generate_ext_data(:todo_change_assignee, todo)).to eq({todo_id: todo.id, todo_title: title, assignee_id_was: user_a.id, assignee_id: user_b.id})
  end

  it "has valid ext data for type todo_change_finished_at" do
    title = "todo title"
    finished_at_was = Time.zone.local(2017, 2, 10, 15, 30, 45)
    finished_at = Time.zone.local(2018, 2, 10, 15, 30, 45)
    todo = Todo.create!(title: title, creator: User.create!, project: Project.create!, finished_at: finished_at_was)
    todo.finished_at = finished_at
    expect(Event.generate_ext_data(:todo_change_finished_at, todo)).to eq({todo_id: todo.id,
                                                                           todo_title: title,
                                                                           finished_at_was: finished_at_was,
                                                                           finished_at: finished_at})
  end
  it "has valid ext data for type comment_create" do
    todo_title = "todo title"
    todo = Todo.create!(title: todo_title, creator: User.create!, project: Project.create!)
    comment_content = "comment content"
    comment = Comment.create!(content: comment_content, todo: todo, user: User.create!)
    expect(Event.generate_ext_data(:comment_create, comment)).to eq({comment_id: comment.id,
                                                               comment_content: comment_content,
                                                               todo_id: todo.id,
                                                               todo_title: todo_title})
  end
end
