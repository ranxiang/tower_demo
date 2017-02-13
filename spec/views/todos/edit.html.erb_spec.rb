require 'rails_helper'

RSpec.describe "todos/edit", type: :view do
  before(:each) do
    @todo = assign(:todo, Todo.create!(
      :title => "MyString",
      :content => "MyText",
      :deleted => false,
      :finished => false,
      :project => nil,
      :creator => nil,
      :assignee => nil
    ))
  end

  it "renders the edit todo form" do
    render

    assert_select "form[action=?][method=?]", todo_path(@todo), "post" do

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
