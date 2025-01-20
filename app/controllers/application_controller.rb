class ApplicationController < ActionController::Base
  # Ensure the user is authenticated before performing certain actions
  before_action :authenticate_user!

  # Permit additional fields for Devise
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_out_path_for(resource_or_scope)
    root_path # or any other path you want to redirect to after logout
  end

  protected

  # Allow first_name and last_name to be passed in Devise forms
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :email, :birthday, :gender, :experience, :type, :profile_picture, dance_ids: []])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:first_name, :email, :birthday, :gender, :experience, :type, :profile_picture, dance_ids: []])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :email, :birthday, :gender, :experience, :type, :profile_picture, dance_ids: []])
  end
end
