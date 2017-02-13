class Todo < ApplicationRecord
  belongs_to :project, optional: true
  belongs_to :creator, class_name: "User", optional: true
  belongs_to :assignee, class_name: "User", optional: true
  has_many :comments
end
