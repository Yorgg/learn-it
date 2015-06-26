class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save      
      respond_to do |format|
        format.html {redirect_to user_path(current_user.id)}
        format.js { render :action => "add_task.js.erb" }
      end 
    else
      render 'new'
    end
  end

  def update
    @task = current_user.tasks.find(params[:id])
    if params[:status] == 'change'
      @task.complete = !(@task.complete)
      if @task.save      
        respond_to do |format|
          format.html {redirect_to user_path(current_user.id)}
          format.js { render :action => "complete.js.erb" }
        end 
      end
    else
      @task.name = params[:task][:name]
      if @task.save      
        respond_to do |format|
          format.html {redirect_to user_path(current_user.id)}
          format.js { render :action => "edit.js.erb" }
        end 
      end
    end
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy
    respond_to do |format|
        format.html {redirect_to user_path(current_user.id)}
        format.js { render :action => "delete.js.erb" }
    end 
  end

  private

  def task_params
    params.require(:task).permit(:name, :date, :complete, :goal_id)
  end
end
