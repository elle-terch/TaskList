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

  def create
    @task = Task.new(
      name: params[:task][:name],
      description: params[:task][:description],
      completion_date: params[:task][:completion_date]
    )

    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

end
