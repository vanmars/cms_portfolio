class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # Ensures only logged in users can access routes
  before_action :authenticate_user!

  # Helpers for Controller and Views
  helper_method [:is_admin?, :is_creator?]

  def is_admin?
    current_user && current_user.admin
  end

  def is_creator?
    Comment.find(params[:id]).user == current_user
  end

  # Configure Devise Strong Parameters
  before_action :configure_permitted_parameters, if: :devise_controller?

protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :last_name])
  end
end
