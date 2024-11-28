class TasksController < ApplicationController

  def index
    # s'il n'y a pas de params on envoi toutes les taches
    # utile pour la page /tasks qui les affiche sur calendrier
    @tasks = Task.all

    # s'il y a des params alors on récupère la date dans les params
    # et on envoi vers notre methode spéciale et sa view
    redirect_to index_date_tasks_path(date: params[:date]) if params[:date].present?
  end

  def description
    @task = Task.find(params[:id])
  end

  def validate
  end

  def index_date
    # puis on récupère les tasks en filtrant avec cette date : where(date: xxxx)
    @tasks = Task.where(date: params[:date])
    # on regroupe les tasks par culture pour l'affichage, ça nous retourne un hash
    # la key: sera le nom de la culture, la valeur associée sera un [] de taches
    # qui sont associées à la culture (key:) et à la date filtrée
    @grouped_task = @tasks.group_by { |task| task.culture.name }
    @date = params[:date]
  end
end
