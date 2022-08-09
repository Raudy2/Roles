class ApplicationController < ActionController::Base

  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    set_flash_message! :alert, :warn_pwned if resource.respond_to?(:pwned?) && resource.pwned?
    super
  end

end
