class Task < ApplicationRecord
  belongs_to :culture
  validates :name, presence: true
  validates :description, presence: true
  validates :order, presence: true # à vérifier l'utilité
  validates :delay, presence: true
  after_create :set_date
  # ajouter status "A faire" par défaut à la création
  # ajouter fait = false par défaut à la création

  CATEGORY = []
  TASK_STATUS = ["A faire", "Validé"] # à supprimer

  # méthode qui attribue une date d'action en fonction du délai
  # propre à la tâche et de la plantation_date de la culture
  def set_date
    puts "Mise à jour de la date"
    start_date = self.culture.plantation_date
    self.date = start_date + self.delay
  end

  # elle sert à quoi cette méthode ?
  def start_time
    date
  end
end
