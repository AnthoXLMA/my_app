class Dance < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :levels
  # validates :challenge, inclusion: { in: ['Novice', 'Intermédiaire', 'Avancé', 'Expert'], message: "%{value} is not a valid gender" }
  # validates :experience, inclusion: { in: ['Novice', 'Intermédiaire', 'Avancé', 'Expert'], message: "%{value} is not a valid gender" }
end
