class TasksController < ApplicationController

  def index
    @tasks = Task.all
    @tasks = @tasks.select{ |task| task.culture.user == current_user }
  end
  
end
