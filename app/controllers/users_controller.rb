class UsersController < ApplicationController
  def show
  	@task = Task.new
  	@user = current_user
  	@tasks = @user.tasks.where(date: Date.today)
  	@tomorrow_tasks = @user.tasks.where(date: Date.today+1)  
  	@goals = @user.goals
  end 
end
