class Dance < ApplicationRecord
  has_and_belongs_to_many :users
  # has_many :dance_users
  # has_many :users, through: :dance_users
  validates :niveau, inclusion: { in: ['novice', 'intermediate', 'advanced', 'expert'], message: "%{value} is not a valid level" }, allow_nil: true
  NIVEAU = ['novice', 'intermediate', 'advanced', 'expert']
end
