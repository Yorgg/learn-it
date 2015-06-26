class UsersController < ApplicationController
  def show
  	@task = Task.new
  	@user = current_user
  	@tasks = @user.tasks.where(date: Date.today)
  	@tomorrow_tasks = @user.tasks.where(date: Date.today+1)  
  	@goals = @user.goals


    @user_tasks_goal = @user.tasks.select("date(date) as day, count(id) as tasks").group("date(date)")
    @complete_tasks = @user.tasks.group("date(date)").where("complete = ?", true).count
 
    @cmon = {}

    @user_tasks_goal.each {|d| @complete_tasks[d.day] = @complete_tasks[d.day].to_f/d.tasks}
    @complete_tasks.each {|key,value| @cmon[key.to_time.to_i] = value}
    
  	@cmon = @cmon.to_json
  end 
end
