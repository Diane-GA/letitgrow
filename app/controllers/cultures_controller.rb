class CulturesController < ApplicationController
  def index
    # on récupère toutes les cultures propre au user connecté
    @cultures = Culture.where(user: current_user)
  end

  def show
    @master_tomate = Culture.find_by(name: "tomate", master: true)
    @master_ciboulette = Culture.find_by(name: "ciboulette", master: true)
    @master_butternut = Culture.find_by(name: "butternut", master: true)
    @master_epinard = Culture.find_by(name: "epinard", master: true)
    @master_radis = Culture.find_by(name: "radis", master: true)
    @master_fraise = Culture.find_by(name: "fraise", master: true)
    @culture = Culture.find(params[:id])

    @culture.tasks.each(&:update_statut)

    tasks_just_reversed = @culture.tasks.sort_by(&:date).reverse

    # TODO: date orange pour aujourd'hui
    @today = Date.today
    start_date = @today - 3
    end_date = @today + 3
    @tasks_reversed = tasks_just_reversed.select { |item| item.date >= start_date && item.date <= end_date }

    if @culture.status == "Graine"
      @progress_status = "seed"
    elsif @culture.status == "Jeune plant"
      @progress_status = "young"
    else
      @progress_status = "mature"
    end
    @age = (@today - @culture.plantation_date).to_i
  end

  def new
    @new_culture = Culture.new
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
    @new_culture.user = current_user
    @new_culture.update(status: params_culture[:status], plantation_date: params_culture[:plantation_date], in_ground: params_culture[:in_ground], outdoor: params_culture[:outdoor])


    unless @new_culture.valid?
      render :new, status: :unprocessable_entity
      return
    end

    # on récupère les master tasks et on itère dessus
    @master_culture.tasks.each do |task|
      # à chaque itération on copie la task .dup
      new_task = task.dup
      # on assigne cette copie à la new culture
      new_task.culture = @new_culture
      # on save la task
      new_task.save
    end

    # on save rla culture + redirection show
    if @new_culture.save
    redirect_to culture_path(@new_culture)
    else
    render :new, status: :unprocessable_entity, notice: "Il manque une info !"
    end
  end

  def destroy
    @culture = Culture.find(params[:id])
    @culture.destroy
    redirect_to cultures_path, status: :see_other
  end

  private

  def params_culture
    params.require(:culture).permit(:name, :status, :in_ground, :outdoor, :plantation_date)
  end
end
