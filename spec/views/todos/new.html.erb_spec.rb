require 'rails_helper'

RSpec.describe "todos/new", type: :view do
  before(:each) do
    assign(:todo, Todo.new(
      :title => "MyString",
      :content => "MyText",
      :deleted => false,
      :finished => false,
      :project => nil,
      :creator => nil,
      :assignee => nil
    ))
  end

  it "renders new todo form" do
    render

    assert_select "form[action=?][method=?]", todos_path, "post" do

      assert_select "input#todo_title[name=?]", "todo[title]"

      assert_select "textarea#todo_content[name=?]", "todo[content]"

      assert_select "input#todo_deleted[name=?]", "todo[deleted]"

      assert_select "input#todo_finished[name=?]", "todo[finished]"

      assert_select "select#todo_project_id[name=?]", "todo[project_id]"

      assert_select "select#todo_creator_id[name=?]", "todo[creator_id]"

      assert_select "select#todo_assignee_id[name=?]", "todo[assignee_id]"
    end
  end
end
