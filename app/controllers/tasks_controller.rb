TASKS = ["walk dog", "brush teeth", "empty dishwasher", "pay student loans", "go for a run", "sleeeeeep"]


class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    task_id = params[:id].to_i
    @task = Task.find(task_id)
    if @task.nil?
      head :not_found
    end
  end

  def new
    @task = Task.new
  end
  
end
