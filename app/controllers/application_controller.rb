class ApplicationController < ActionController::Base
  include Pundit # pundit gem for permission  and policies

  protect_from_forgery with: :exception

  before_action :authenticate_user!
  # force user to login page, otherwise render to login page

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def admin_types # avaible only for controllers, not view
    ['AdminUser', 'Manager'] # Mananger is just an example
  end

  private

  def user_not_authorized # if not authorized then redirect to root page
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end
end
