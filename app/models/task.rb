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

  private

  # méthode qui attribue une date d'action en fonction du délai
  # propre à la tâche et de la plantation_date de la culture
  def set_date
    unless self.date.present?
      puts "Mise à jour de la date"
      start_date = self.culture.plantation_date
      self.date = start_date + self.delay
    end
  end

  # méthode pour attribuer par défaut la valeur false à "done"
  def set_default_done
    self.update(done: false)
  end

end
