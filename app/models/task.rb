class Task < ApplicationRecord
  belongs_to :culture
  validates :name, presence: true
  validates :description, presence: true
  validates :order, presence: true
  after_create :set_date

  CATEGORY = []
  TASK_STATUS = ["A faire", "En cours", "Valider"]

  # créer cette méthode qui attribue une date en fonction du délai
  # et de la plantation date
  # pour ça il faut créer la colonne "délai" dans la table task
  # il s'agit du délai entre la plantation date et l'execution de la tache
  # ce délai sera rempli dans nos seed pour nos master tasks car on ne
  # pourra pas remplir la date d'execution directement
  def set_date
    puts "je mets à jour la date"
    p self.culture.plantation_date
  end
  
end
