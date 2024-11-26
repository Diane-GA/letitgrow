class CulturesController < ApplicationController

  def index
    # on récupère toutes les cultures propre au user connecté
    @cultures = Culture.where(user: current_user)
  end

  def new
  end

  def create
    raise
    # récupérer la master culture via les params : name, status master true
    
    # on créé la new
    # on lui assigne les valeurs souhaitées de la master
    # on récupère les master tasks @master_culture.tasks.each
      # à chaque itération on copie .dup
      # on assigne cette dup à la new culture
      # on save la task
    # on save la task + redirection show
  end

end

#<ActionController::Parameters {"authenticity_token"=>"2C6gKY_OY2oOjRXuYvx2iEfZEFNF7OdgLfu5CxexSHwSK3DVkcmxcATM7i1wdcDjyaPHvNKPG5xoIcLYDzG3nw", "culture"=>{"name"=>"Pomme de terre", "plantation_date(1i)"=>"2024", "plantation_date(2i)"=>"11", "plantation_date(3i)"=>"26", "outdoor"=>"1", "in_ground"=>"0", "status"=>"Petit plan"}, "commit"=>"Create Culture", "controller"=>"cultures", "action"=>"create"} permitted: false>
