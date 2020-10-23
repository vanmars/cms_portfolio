class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # Ensures only logged in users can access routes
  before_action :authenticate_user!

  # Helpers for Controller and Views
  helper_method :is_admin

  def is_admin?
    current_user && current_user.is_admin
  end
end
