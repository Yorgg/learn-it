class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :new_goal
  require 'date'

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  def new_goal
  	@new_goal = Goal.new	
  end
end
