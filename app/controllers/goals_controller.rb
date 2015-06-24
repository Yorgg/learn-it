class GoalsController < ApplicationController
  def show
  	@goal_id = params[:id]
  	@task = Task.new
  	@user = current_user
  	@goal = @user.goals.find(@goal_id)
  	@tasks = @user.tasks.where(date: Date.today, goal_id: @goal_id)
  	@tomorrow_tasks = @user.tasks.where(date: Date.today+1)  
  	@goals = @user.goals 	
  end 

  def create 
  	@goal = current_user.goals.build(goal_create_params)
    @goal.color = current_user.goals.count + 1
    if @goal.save
      redirect_to @goal
    else
      redirect_to user_path(current_user.id)
    end
  end
  
  private

  def goal_create_params
    params.require(:goal).permit(:name)
  end
end
