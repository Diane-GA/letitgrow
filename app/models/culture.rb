class Culture < ApplicationRecord
  has_ancestry
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates :name, presence: true

  CULTURE_STATUS = ["Graine", "Premiéres feuilles", "Petit plan", "Premiére fleurs", "Premiers fruits", "fin de fructification"]
end
