class CulturesController < ApplicationController

  def index
    # on récupère toutes les cultures propre au user connecté
    @cultures = Culture.where(user: current_user)
  end

  def show
    @culture = Culture.find(params[:id])
  end
end
