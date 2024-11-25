class Culture < ApplicationRecord
  belongs_to :user
  has_many :tasks
  validates :name, presence: true

  CULTURE_STATUS = ["Graine", "Premiéres feuilles", "Petit plan", "Premiére fleurs", "Premiers fruits", "fin de fructification"]
end
