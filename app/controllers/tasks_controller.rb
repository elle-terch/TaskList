TASKS = ["walk dog", "brush teeth", "empty dishwasher", "pay student loans", "go for a run", "sleeeeeep"]



class TasksController < ApplicationController
  def index
    @tasks = TASKS
  end
end
