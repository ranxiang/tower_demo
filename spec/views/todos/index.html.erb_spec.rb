require 'rails_helper'

RSpec.describe "todos/index", type: :view do
  before(:each) do
    assign(:todos, [
      Todo.create!(
        :title => "Title",
        :content => "MyText",
        :deleted => false,
        :finished => false,
        :project => nil,
        :creator => nil,
        :assignee => nil
      ),
      Todo.create!(
        :title => "Title",
        :content => "MyText",
        :deleted => false,
        :finished => false,
        :project => nil,
        :creator => nil,
        :assignee => nil
      )
    ])
  end

  it "renders a list of todos" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 4
    assert_select "tr>td", :text => nil.to_s, :count => 8
  end
end
