class PaymentsController < ApplicationController
  layout 'dashboard'
  def index
    @payments = current_user.payments
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
