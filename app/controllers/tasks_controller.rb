class TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save      
      redirect_to user_path(current_user.id)
    else
      render 'new'
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :date)
  end
end
