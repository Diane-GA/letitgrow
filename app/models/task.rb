class Task < ApplicationRecord
  belongs_to :culture
  validates :name, presence: true
  validates :description, presence: true
  # validates :order, presence: true / order n'est plus forcément utile

  # ajouter fait = false par défaut à la création

  after_create :set_date

  CATEGORY = []

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
