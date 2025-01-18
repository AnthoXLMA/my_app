class DanceUser < ApplicationRecord
  # belongs_to :user
  # belongs_to :dance
  # Validations for level (optional)
  validates :level, inclusion: { in: ['novice', 'intermediate', 'advanced', 'expert'] }
end
