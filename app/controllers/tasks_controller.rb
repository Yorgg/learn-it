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

  def edit
    @task = current_user.tasks.find(params[:id])
    @task.complete = !(@task.complete)
    if @task.save      
      respond_to do |format|
        format.html {redirect_to user_path(current_user.id)}
        format.js { render :action => "complete.js.erb" }
      end 
    end
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.delete
    respond_to do |format|
        format.html {redirect_to user_path(current_user.id)}
        format.js { render :action => "delete.js.erb" }
    end 
  end

  private

  def task_params
    params.require(:task).permit(:name, :date)
  end
end
