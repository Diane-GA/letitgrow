class Culture < ApplicationRecord
  belongs_to :user
  has_many :tasks
  validates :name, presence: true
  validates :plantation_date, presence: true

  CULTURE_STATUS = []
end
