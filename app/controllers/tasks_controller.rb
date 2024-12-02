class TasksController < ApplicationController

  def index
    # s'il n'y a pas de params on envoi toutes les taches
    # utile pour la page /tasks qui les affiche sur calendrier
    @tasks = Task.all
    # @tasks = @tasks.select { |task| task.culture.user == current_user }
  end
end
