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
  CULTURE_NAME = ["butternut", "carotte", "ciboulette", "epinard", "fraise", "oignon", "piment", "pomme de Terre", "radis", "tomate"]
  # mettre à jour la liste avec les noms des master cultures

  # methode de classe pour reset la plantation_date (début de vie de la plante)
  # selon le status et la date rentrés par le user
  def reset_plantation_date
    if self.name == "tomate" && self.status == "Jeune plant"
      self.update(plantation_date: self.plantation_date - 25) # 25 jours entre graine et plant
    elsif self.name == "tomate" && self.status == "Mature"
      self.update(plantation_date: self.plantation_date - 80) # 80 jours entre graine et plant
    elsif self.name == "ciboulette" && self.status == "Jeune plant"
      self.update(plantation_date: self.plantation_date - 25) # 10 jours entre graine et plant
    elsif self.name == "ciboulette" && self.status == "Mature"
      self.update(plantation_date: self.plantation_date - 40) # 40 jours entre graine et plant
    elsif self.name == "butternut" && self.status == "Jeune plant"
      self.update(plantation_date: self.plantation_date - 25) # 25 jours entre graine et plant
    elsif self.name == "butternut" && self.status == "Mature"
      self.update(plantation_date: self.plantation_date - 120) # 120 jours entre graine et plant
    elsif self.name == "fraise" && self.status == "Jeune plant"
      self.update(plantation_date: self.plantation_date - 61) # 61 jours entre graine et plant
    elsif self.name == "fraise" && self.status == "Mature"
      self.update(plantation_date: self.plantation_date - 190) # 190 jours entre graine et plant
    elsif self.name == "epinard" && self.status == "Jeune plant"
      self.update(plantation_date: self.plantation_date - 26) # 26 jours entre graine et plant
    elsif self.name == "epinard" && self.status == "Mature"
      self.update(plantation_date: self.plantation_date - 70) # 70 jours entre graine et plant
    elsif self.name == "radis" && self.status == "Jeune plant"
      self.update(plantation_date: self.plantation_date - 20) # 20 jours entre graine et plant
    elsif self.name == "radis" && self.status == "Mature"
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

    # change le statut de tomate selon son age
    if self.name == "tomate"
      if age_plante > 25
        self.update(status: "Jeune plant")
      elsif age_plante >= 80
        self.update(status: "Mature")
      end

      # change le statut de ciboulette selon son age
    elsif self.name == "ciboulette"
      if age_plante > 25
        self.update(status: "Jeune plant")
      elsif age_plante >= 40
        self.update(status: "Mature")
      end

      # change le statut de butternut selon son age
    elsif self.name == "butternut"
      if age_plante > 25
        self.update(status: "Jeune plant")
      elsif age_plante >= 120
        self.update(status: "Mature")
      end

      # change le statut de fraise selon son age
    elsif self.name == "fraise"
      if age_plante > 61
        self.update(status: "Jeune plant")
      elsif age_plante >= 190
        self.update(status: "Mature")
      end

      # change le statut de epinard selon son age
    elsif self.name == "epinard"
      if age_plante > 26
        self.update(status: "Jeune plant")
      elsif age_plante >= 70
        self.update(status: "Mature")
      end

      # change le statut de radis selon son age
    elsif self.name == "radis"
      if age_plante > 20
        self.update(status: "Jeune plant")
      elsif age_plante >= 37
        self.update(status: "Mature")
      end
    end
  end

  # methode pour associer le picto correspondant à la culture
  def culture_picto
    if self.name == "tomate"
      return 'fi fi-rr-tomato'
    elsif self.name == "ciboulette"
      return 'fi fi-rr-grass'
    elsif self.name == "butternut"
      return 'fi fi-rs-pear'
    elsif self.name == "fraise"
      return 'fi fi-rs-strawberry'
    elsif self.name == "epinard"
      return 'fi fi-tr-bio-leaves'
    elsif self.name == "radis"
      return 'fi fi-rs-radish'
    end
  end

end
