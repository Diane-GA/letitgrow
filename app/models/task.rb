class Task < ApplicationRecord
  belongs_to :culture
  validates :name, presence: true, length: { minimum: 3, maximum: 10 }
  validates :description, presence: true, length: { minimum: 3, maximum: 200 }
  # validates :order, presence: true / order n'est plus forcément utile

  after_create_commit :set_date
  after_create_commit :set_default_done

  CATEGORY = []

  # Permet de faire fonctionner simple calendar
  def start_time
    date
  end

  def category_picto
    {
      "Planter" => "fi fi-rr-shovel",
      "Arroser" => "fi fi-rs-raindrops",
      "Tailler" => "fi fi-rs-scissors",
      "Encourager" => "fi fi-tr-hand-holding-seeding",
      "Protéger" => "fi fi-bs-shield",
      "Récolter" => "fi fi-rs-hand-paper",
      "Arracher" => "fi fi-rr-hourglass-end",
      "Custom" => "fi fi-rc-settings"
    }[category]
  end

  # méthode qui attribue une date d'action en fonction du délai
  # propre à la tâche et de la plantation_date de la culture
  def set_date
    puts "Mise à jour de la date"
    start_date = culture.plantation_date
    self.date = start_date + delay unless category == "Custom"
  end

  # méthode pour attribuer par défaut la valeur false à "done"
  def set_default_done
    if culture.plantation_date < Date.today && date < Date.today
      update(done: true)
    else
      update(done: false)
    end
  end

  def update_statut
    update(date: Date.today + 1) if done == false && date < Date.today
  end
end
