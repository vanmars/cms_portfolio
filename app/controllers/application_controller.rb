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
end
