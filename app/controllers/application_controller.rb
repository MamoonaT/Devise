class ApplicationController < ActionController::Base
  #before_action :authenticate_admin_user!
	include Pundit::Authorization
	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  before_action :configure_permitted_parameters, if: :devise_controller?
  def pundit_user
    current_admin_user
  end
  
  private


  def configure_permitted_parameters
    added_attrs = [:first_name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end

