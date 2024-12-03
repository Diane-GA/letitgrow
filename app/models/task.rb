class Task < ApplicationRecord
  belongs_to :culture
  validates :name, presence: true
  validates :description, presence: true
  # validates :order, presence: true / order n'est plus forcément utile

  after_create_commit :set_date
  after_create_commit :set_default_done

  CATEGORY = []

  # Permet de faire fonctionner simple calendar
  def start_time
    date
  end

  def category_picto()
    if self.category == "Planter"
      return "fi fi-rr-shovel"
    elsif self.category == "Arroser"
      return "fi fi-rs-raindrops"
    elsif self.category == "Tailler"
      return "fi fi-rs-scissors"
    elsif self.category == "Encourager"
      return "fi fi-tr-hand-holding-seeding"
    elsif self.category == "Protéger"
      return "fi fi-bs-shield"
    elsif self.category == "Récolter"
      return "fi fi-rs-hand-paper"
    elsif self.category == "Arracher"
      return "fi fi-rr-hourglass-end"
    elsif self.category == "Custom"
      return "fi fi-rc-settings"
    end
  end

  # méthode qui attribue une date d'action en fonction du délai
  # propre à la tâche et de la plantation_date de la culture
  def set_date
    puts "Mise à jour de la date"
    start_date = self.culture.plantation_date
    self.date = start_date + self.delay unless category == "Custom"
  end

  # méthode pour attribuer par défaut la valeur false à "done"
  def set_default_done
    self.update(done: false)
  end
end
