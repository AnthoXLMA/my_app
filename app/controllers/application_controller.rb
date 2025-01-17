class ApplicationController < ActionController::Base
  # Ensure the user is authenticated before performing certain actions
  before_action :authenticate_user!

  # Permit additional fields for Devise
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Allow first_name and last_name to be passed in Devise forms
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :birthday])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:first_name, :birthday])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :birthday])
  end
end
