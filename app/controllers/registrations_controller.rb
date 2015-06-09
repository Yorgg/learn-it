class RegistrationsController < Devise::RegistrationsController
  def create
	super
  end

  def update
	super
  end

  private 
  def sign_up_params
    params.require(:user).permit(:name, :email, :password)
  end  
end