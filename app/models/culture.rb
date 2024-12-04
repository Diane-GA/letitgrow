class Culture < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates :name, presence: true
  validates :plantation_date, presence: true
  validates :outdoor, inclusion: { in: [true, false]}
  validates :in_ground, inclusion: { in: [true, false]}
  has_one_attached :photo

  after_create_commit :reset_plantation_date
  after_create_commit :set_life_stage

  CULTURE_STATUS = ["Graine", "Jeune plant", "Mature"]
  CULTURE_NAME = ["Butternut", "Carotte", "Ciboulette", "Epinard", "Fraise", "Oignon", "Piment", "Pomme de Terre", "Radis", "Tomate"]
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
    elsif self.name == "Fraise" && self.status == "Jeune plant"
      self.update(plantation_date: self.plantation_date - 61) # 61 jours entre graine et plant
    elsif self.name == "Fraise" && self.status == "Mature"
      self.update(plantation_date: self.plantation_date - 190) # 190 jours entre graine et plant
    elsif self.name == "Epinard" && self.status == "Jeune plant"
      self.update(plantation_date: self.plantation_date - 26) # 26 jours entre graine et plant
    elsif self.name == "Epinard" && self.status == "Mature"
      self.update(plantation_date: self.plantation_date - 70) # 70 jours entre graine et plant
    elsif self.name == "Radis" && self.status == "Jeune plant"
      self.update(plantation_date: self.plantation_date - 20) # 20 jours entre graine et plant
    elsif self.name == "Radis" && self.status == "Mature"
      self.update(plantation_date: self.plantation_date - 37) # 37 jours entre graine et plant
    end
  end

  # methode de classe qui recalcule le stade de vie de la plante par rapport à today
  # pour l'afficher sur le cycle et le mettre à jour lors de la création (car la plantation_date
  # est recalculée à la création et le mettrait par défaut en "graine")
  def set_life_stage
    # calcul la différence entre today et la plantation_date
    today = Date.today
    age_plante = (today - self.plantation_date).to_i

    # change le statut de Tomate selon son age
    if self.name == "Tomate"
      if age_plante > 25
        self.update(status: "Jeune plant")
      elsif age_plante >= 80
        self.update(status: "Mature")
      end

      # change le statut de Ciboulette selon son age
    elsif self.name == "Ciboulette"
      if age_plante > 25
        self.update(status: "Jeune plant")
      elsif age_plante >= 40
        self.update(status: "Mature")
      end

      # change le statut de Butternut selon son age
    elsif self.name == "Butternut"
      if age_plante > 25
        self.update(status: "Jeune plant")
      elsif age_plante >= 120
        self.update(status: "Mature")
      end

      # change le statut de Fraise selon son age
    elsif self.name == "Fraise"
      if age_plante > 61
        self.update(status: "Jeune plant")
      elsif age_plante >= 190
        self.update(status: "Mature")
      end

      # change le statut de Epinard selon son age
    elsif self.name == "Epinard"
      if age_plante > 26
        self.update(status: "Jeune plant")
      elsif age_plante >= 70
        self.update(status: "Mature")
      end

      # change le statut de Radis selon son age
    elsif self.name == "Radis"
      if age_plante > 20
        self.update(status: "Jeune plant")
      elsif age_plante >= 37
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
    elsif self.name == "Fraise"
      return 'fi fi-rs-strawberry'
    elsif self.name == "Epinard"
      return 'fi fi-tr-bio-leaves'
    elsif self.name == "Radis"
      return 'fi fi-rs-radish'
    end
  end

end
