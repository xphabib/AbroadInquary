class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :lock_user_check

  protected

  def lock_user_check
    if current_user.present?
      if current_user.admin_confirmation == false
        sign_out
        redirect_to root_path
        flash[:warning] = 'Your Account is under review'
      end
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password] )
  end
end
