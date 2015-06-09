class UsersController < ApplicationController
  def show
  	@user = current_user
  	@today_tasks = @user.tasks.where(date: Date.today)
  	@tomorrow_tasks = @user.tasks.where(date: Date.tomorrow)  	
  end 
end
