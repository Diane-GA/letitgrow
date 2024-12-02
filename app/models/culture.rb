class Culture < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates :name, presence: true
  validates :plantation_date, presence: true
  has_one_attached :photo

  after_create_commit :reset_plantation_date
  after_create_commit :set_life_stage

  CULTURE_STATUS = ["Graine", "Jeune plant", "Mature"]
  CULTURE_NAME = ["Aubergine", "Butternut", "Carotte", "Ciboulette", "Citron", "Fraise", "Oignon", "Piment", "Pomme de Terre", "Tomate"]
  # mettre à jour la liste avec les noms des master cultures

  # methode de classe pour reset la plantation_date (début de vie de la plante)
  # selon le status et la date rentrés par le user
  def reset_plantation_date
    if self.name == "Tomate" && self.status == "Jeune plant"
      self.update(plantation_date: self.plantation_date - 25) # 25 jours entre graine et plant
    elsif self.name == "Tomate" && self.status == "Mature"
      self.update(plantation_date: self.plantation_date - 80) # 80 jours entre graine et plant
    elsif self.name == "Ciboulette" && self.status == "Jeune plant"
      self.update(plantation_date: self.plantation_date - 25) # 10 jours entre graine et plant
    elsif self.name == "Ciboulette" && self.status == "Mature"
      self.update(plantation_date: self.plantation_date - 40) # 40 jours entre graine et plant
    elsif self.name == "Butternut" && self.status == "Jeune plant"
      self.update(plantation_date: self.plantation_date - 25) # 25 jours entre graine et plant
    elsif self.name == "Butternut" && self.status == "Mature"
      self.update(plantation_date: self.plantation_date - 120) # 120 jours entre graine et plant
    end
  end

  # methode de classe qui recalcule le stade de vie de la plante par rapport à today
  # pour l'afficher sur le cycle et le mettre à jour lors de la création (car la plantation_date
  # est recalculée à la création et le mettrait par défaut en "graine")
  def set_life_stage
    # calcul la différence entre today et la plantation_date
    today = Date.today
    age_plante = (today - self.plantation_date).to_i

    # change le statut de tomate selon son age
    if self.name == "Tomate"
      if age_plante > 25
        self.update(status: "Jeune plant")
      elsif age_plante >= 80
        self.update(status: "Mature")
      end

      # change le statut de ciboulette selon son age
    elsif self.name == "Ciboulette"
      if age_plante > 25
        self.update(status: "Jeune plant")
      elsif age_plante >= 40
        self.update(status: "Mature")
      end

      # change le statut de butternut selon son age
    elsif self.name == "Butternut"
      if age_plante > 25
        self.update(status: "Jeune plant")
      elsif age_plante >= 120
        self.update(status: "Mature")
      end
    end
  end

  # methode pour associer le picto correspondant à la culture
  def culture_picto
    if self.name == "Tomate"
      return 'fi fi-rr-tomato'
    elsif self.name == "Ciboulette"
      return 'fi fi-rr-grass'
    elsif self.name == "Butternut"
      return 'fi fi-rs-pear'
    end
  end

end
