class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
    set_flash_message! :alert, :warn_pwned if resource.respond_to?(:pwned?) && resource.pwned?
    super
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :name, :email, :password, :password_confirmation, :avatar, :preferred_language)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :name, :email, :password, :password_confirmation, :current_password, :avatar, :preferred_language)}
  end

end
