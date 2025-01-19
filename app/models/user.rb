class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_picture
  has_and_belongs_to_many :dances
  has_many :levels, through: :dances
  has_many :events
  # has_many :dance_users
  # has_many :dances, through: :dance_users

end
