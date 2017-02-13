require 'rails_helper'

RSpec.describe "comments/new", type: :view do
  before(:each) do
    assign(:comment, Comment.new(
      :content => "MyText",
      :todo => nil,
      :user => nil
    ))
  end

  it "renders new comment form" do
    render

    assert_select "form[action=?][method=?]", comments_path, "post" do

      assert_select "textarea#comment_content[name=?]", "comment[content]"

      assert_select "select#comment_todo_id[name=?]", "comment[todo_id]"

      assert_select "select#comment_user_id[name=?]", "comment[user_id]"
    end
  end
end
