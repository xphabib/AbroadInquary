class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :lock_user_check
  # before_action :balance_check
  # attr_reader :current_balance
  # check_authorization unless: :devise_controller?


  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end

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

  # def balance_check
  #   @current_balance = Payment.current_balance(current_user) if current_user.present?
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :email, :password] )
  end
end
