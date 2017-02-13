class Project < ApplicationRecord
  belongs_to :team, optional: true
end
