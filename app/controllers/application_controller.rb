class ApplicationController < ActionController::Base
  #before_action :authenticate_admin_user!
	include Pundit::Authorization
  before_action :current_user
	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
 

  private

  def user_not_authorized
    flash[:alert] = "You need to sign in to perform this action."
    redirect_to(request.referrer || root_path)
  end

  def current_user
    current_admin_user
  end

end
