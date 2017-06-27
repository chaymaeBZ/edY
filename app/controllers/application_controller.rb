class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permited_parameters, if: :devise_controller?

  def is_admin?
    if !current_user.admin?
      redirect_to root_path, alert: "Admin action only!"
    end
  end
  protected 

    def configure_permited_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone])
    end
 
end
