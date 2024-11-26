class Culture < ApplicationRecord
  has_ancestry
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates :name, presence: true
  has_one_attached :photo

  CULTURE_STATUS = ["Graine", "Premiéres feuilles", "Petit plan", "Premiére fleurs", "Premiers fruits", "Fin de fructification"]
  CULTURE_NAME = ["Pomme de terre", "Tomate", "Salade", "Poivron"] #mettre à jour la liste avec les noms des master cultures
end
