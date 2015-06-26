class GoalsController < ApplicationController
  def show
  	@goal_id = params[:id]
  	@task = Task.new
  	@user = current_user
  	@goal = @user.goals.find(@goal_id)
  	@tasks = @user.tasks.where(date: Date.today, goal_id: @goal_id)
  	@tomorrow_tasks = @user.tasks.where(date: Date.today+1)  
  	@goals = @user.goals 	

    #to do: clean this up!
    @user_tasks_goal = @user.tasks.select("date(date) as day, count(id) as tasks").where("goal_id = ?", @goal_id).group("date(date)")
    @complete_tasks = current_user.tasks.group("date(date)").where("complete = ? AND goal_id = ?", true, @goal_id).count
 
    @cmon = {}

    @user_tasks_goal.each {|d| @complete_tasks[d.day] = @complete_tasks[d.day].to_f/d.tasks}
    @complete_tasks.each {|k,v| @cmon[k.to_time.to_i] = v}
    
  	@cmon = @cmon.to_json
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

  def destroy
    @goal= current_user.goals.find(params[:id])
    @goal.destroy
    respond_to do |format|
        format.html {redirect_to user_path(current_user.id)}
        format.js { render :action => "delete.js.erb" }
    end 
  end
  
  private

  def goal_create_params
    params.require(:goal).permit(:name)
  end
end
