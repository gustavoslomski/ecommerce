class ApplicationController < ActionController::Base
  include Pundit::Authorization

	before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u| 
			u.permit(:name, :phone, :email, :password, :password_confirmation)
		end
  end
end
