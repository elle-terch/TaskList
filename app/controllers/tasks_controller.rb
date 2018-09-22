
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
    @task = Task.new()
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit
    @task = Task.find_by(id: params[:id])
  end

  def update
    task = Task.find_by(id: params[:id])
    if task.update(task_params)

      redirect_to task_path(task.id)
    else
      render :edit
    end
  end

  def delete
    task = Task.find_by(id: params[:id])
    task.destroy
    redirect_to tasks_path
  end

  def update_status
    task = Task.find_by(id: params[:id])
    if task.completion_date == nil
      task.update(completion_date: Date.today)
    else
      task.update(completion_date: nil)
    end

    if task.update(id: params[:id])
      redirect_to task_path(task.id)
    end
  end
##display logic: if task.completion_date != nil, then display class is x? vs. y?

  private

  def task_params
    return params.require(:task).permit(:name, :description, :completion_date)
  end

end
