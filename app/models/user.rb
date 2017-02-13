class User < ApplicationRecord
  belongs_to :team, optional: true
end
