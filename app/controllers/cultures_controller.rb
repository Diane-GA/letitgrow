class CulturesController < ApplicationController
  def index
    # on récupère toutes les cultures propre au user connecté
    @cultures = Culture.where(user: current_user)
  end

  def show
    @culture = Culture.find(params[:id])
    @tasks_reversed = @culture.tasks.reverse
    if @culture.status == "Graine"
      @progress_status = "seed"
    elsif @culture.status == "Jeune plant"
      @progress_status = "young"
    else
      @progress_status = "mature"
    end
    @age = (Date.today - @culture.plantation_date).to_i
  end

  def new
  end

  def create
    # On récupère la master culture via les params : name et master true
    @master_culture = Culture.find_by(name: params_culture[:name], master: true)
    # Initialement on récupérait la master culture via les params : name, status master true
    # @master_culture = Culture.find_by(name: params_culture[:name], status: params_culture[:status], master: true)

    # on assigne à la nouvelle culture les caractéristiques de master
    @new_culture = @master_culture.dup
    # ajouter les valeurs à @new_culture
    @new_culture.master = false
    @new_culture.update(status: params_culture[:status], plantation_date: params_culture[:plantation_date], in_ground: params_culture[:in_ground], outdoor: params_culture[:outdoor])

    # on récupère les master tasks et on itère dessus
    @master_culture.tasks.each do |task|
      # à chaque itération on copie la task .dup
      new_task = task.dup
      # on assigne cette copie à la new culture
      new_task.culture = @new_culture
      # on save la task
      new_task.save
    end
    # on save la culture + redirection show
    @new_culture.save
    redirect_to culture_path(@new_culture)
  end

  private

  def params_culture
    params.require(:culture).permit(:name, :status, :in_ground, :outdoor, :plantation_date)
  end
end
