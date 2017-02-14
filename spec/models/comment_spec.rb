require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "triggers event_callback_for_comment_create on create" do
    comment = Comment.new
    expect(comment).to receive(:event_callback_for_comment_create)
    comment.save
  end
end
