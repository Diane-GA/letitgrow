class Culture < ApplicationRecord
  has_ancestry
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates :name, presence: true
  has_one_attached :photo
  after_create :reset_plantation_date

  CULTURE_STATUS = ["Graine", "Jeune plant", "Mature"]
  CULTURE_NAME = ["Pomme de terre", "Tomate", "Salade", "Poivron"] #mettre à jour la liste avec les noms des master cultures

  # methode de classe pour reset la plantation_date (début de vie de la plante)
  # selon le status et la date rentrés par le user
  def reset_plantation_date
    if self.name == "Tomate" && self.status == "Jeune plant"
      self.update(plantation_date: self.plantation_date - 14) # 14 jours entre graine et plant
    elsif self.name == "Tomate" && self.status == "Mature"
      self.update(plantation_date: self.plantation_date - 85) # 85 jours entre graine et plant

    elsif self.name == "Ciboulette" && self.status == "Jeune plant"
      self.update(plantation_date: self.plantation_date - 10) # 10 jours entre graine et plant
    elsif self.name == "Ciboulette" && self.status == "Mature"
      self.update(plantation_date: self.plantation_date - 40) # 40 jours entre graine et plant

    elsif self.name == "Butternut" && self.status == "Jeune plant"
      self.update(plantation_date: self.plantation_date - 30) # 30 jours entre graine et plant
    elsif self.name == "Butternut" && self.status == "Mature"
      self.update(plantation_date: self.plantation_date - 85) # 85 jours entre graine et plant
    end
  end

# methode de classe set_life_stage
# utile pour recalculer le stade de vie de la plante par rapport à today
# pour l'afficher sur le cycle
# if patate, plantation_date + 20j = plant etc
# if carrotte, plantation_date + 15j = plant, etc

end
