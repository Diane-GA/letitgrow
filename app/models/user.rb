class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cultures
  has_one_attached :photo
  # validates :username, :uniqueness
  # validates :username, presence: true
  # validates :address, presence: true
end
