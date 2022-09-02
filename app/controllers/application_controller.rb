class ApplicationController < ActionController::Base
  #before_action :authenticate_admin_user!
	include Pundit::Authorization
	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
 
  def pundit_user
    current_admin_user
  end
  
  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end

