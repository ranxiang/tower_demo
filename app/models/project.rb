class Project < ApplicationRecord
  belongs_to :team, optional: true
  has_many :user_project_assignments
  has_many :users, through: :user_project_assignments
end
