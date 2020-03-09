class PaymentsController < ApplicationController
  layout 'dashboard'
  def index
    @payments = current_user.payments
    @current_balance = Payment.current_balance(current_user)

  end

  def new

  end

  def create

  end

  private
  def payment_params
    params.require(:payment).permit!
  end
end
