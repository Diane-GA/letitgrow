class TasksController < ApplicationController
  def index
    # s'il n'y a pas de params on envoi toutes les taches
    # utile pour la page /tasks qui les affiche sur calendrier
    @tasks = Task.all
    @tasks = @tasks.select { |task| task.culture.user == current_user }

    # s'il y a des params alors on récupère la date dans les params
    # et on envoi vers notre methode spéciale et sa view
    redirect_to index_date_tasks_path(date: params[:date]) if params[:date].present?
  end

  def new
    @culture = Culture.find(params[:culture_id])
    @task = Task.new
  end

  def create
    @culture = Culture.find(params[:culture_id])
    @task = Task.new(task_params)
    @task.category = "Custom"
    @task.culture = @culture
    if @task.save
      redirect_to tasks_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_path
  end

  def description
    @task = Task.find(params[:id])
  end

  def validate
    @task = Task.find(params[:id])
    if @task.toggle!(:done)
      render "cultures/show", locals: { task: @task }, partial: "cultures/tasks_list"
    else
      redirect_to culture_path(@task.culture)
    end
  end

  def valid_task
    @task = Task.find(params[:id])
    if @task.toggle!(:done)
      render :index, locals: { task: @task }, partial: "tasks/validate_task"
    else
      redirect_to tasks_path
    end
  end

  def index_date
    # on récupère les tasks en filtrant avec la date : where(date: xxxx)
    @tasks = Task.includes(:culture).where(date: params[:date])
    # on filtre les tache du current_user
    @tasks = @tasks.select { |task| task.culture.user == current_user }
    # on regroupe les tasks par culture pour l'affichage, ça nous retourne un hash
    # la key: sera le nom de la culture, la valeur associée sera un [] de taches
    # qui sont associées à la culture (key:) et à la date filtrée
    @grouped_task = @tasks.group_by { |task| task.culture.name }
    @date = params[:date]
    @en_date = Date.new(@date.split("-")[0].to_i, @date.split("-")[1].to_i, @date.split("-")[2].to_i)
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :date)
  end
end
