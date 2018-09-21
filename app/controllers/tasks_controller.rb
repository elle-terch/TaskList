
class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    task_id = params[:id]
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

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(
      name: params[:task][:name],
      description: params[:task][:description],
      completion_date: params[:task][:completion_date]
    )

    if @task.save
      redirect_to task_path
    else
      render :new
    end
  end

  def delete
    task = Task.find_by(id: params[:id])
    task.destroy
    redirect_to tasks_path
  end

  def update_status
    task = Task.find_by(id: params[:id])
    task.completion_date = Date.today
  end

end
