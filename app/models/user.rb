class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  self.inheritance_column = :user_type

  has_one_attached :profile_picture
  has_and_belongs_to_many :dances
  has_many :levels, through: :dances
  has_many :events
  # has_many :dance_users
  # has_many :dances

  validates :gender, inclusion: { in: ['Lady', 'Gentleman', 'Association'], message: "%{value} is not a valid gender" }
  # validates :experience, inclusion: { in: ['Novice', 'Intermédiaire', 'Avancé', 'Expert'], message: "%{value} is not a valid experience" }
  validates :type, inclusion: { in: ['Partner', 'Teacher', 'Organisateur', 'DJ'], message: "%{value} is not a valid type" }
  # validates :dances, inclusion: { in: ["Salsa" , "Bachata" , "Kizomba" , "Kompa" , "Zumba" , "Zouk" , "Rock" , "West Coast Swing" , "Ballet" , "Hip-Hop", "Waltz", "Tango"], message: "%{value} is not a valid type" }
end
