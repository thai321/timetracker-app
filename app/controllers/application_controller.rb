class ApplicationController < ActionController::Base
  include Pundit # pundit gem for permission  and policies

  protect_from_forgery with: :exception

  before_action :authenticate_user!
  # force user to login page, otherwise render to login page
end
