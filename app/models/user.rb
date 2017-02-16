class User < ApplicationRecord
  belongs_to :team, optional: true
  has_many :created_todos, class_name: "Todo", foreign_key: "creator_id"
  has_many :assigned_todos, class_name: "Todo", foreign_key: "assignee_id"
  has_many :comments
  has_many :user_project_assignments
  has_many :projects, through: :user_project_assignments
end
