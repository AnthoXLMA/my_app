class Match < ApplicationRecord
  belongs_to :user
  belongs_to :disliked_user, class_name: 'User'
  validates :liked, inclusion: { in: [true, false] }
end
