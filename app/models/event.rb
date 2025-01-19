class Event < ApplicationRecord
  # Validations
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :location, presence: true

  # Additional logic or methods
  def duration
    end_date - start_date
  end
end
