# == Schema Information
#
# Table name: payments
#
#  id               :bigint           not null, primary key
#  amount           :float
#  payment_type     :string
#  paymentable_type :string
#  status           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  paymentable_id   :integer
#  transaction_id   :integer
#  user_id          :integer
#

class Payment < ApplicationRecord
  # belongs_to :paymentable, polymorphic: true
  belongs_to :user
  scope :cash_in, -> { where(payment_type: 'cash_in')}
  scope :cash_out, -> { where(payment_type: 'cash_out')}
  scope :sent_money, -> { where(payment_type: 'sent_money')}
  scope :received_money, -> { where(payment_type: 'received_money')}

  Payment_type = ['cash_in', 'cash_out', 'sent_money', 'received_money']

  before_save :amount_validation

  def self.current_balance(user)
    payments = user.payments
    cash_in_payments = payments.cash_in
    cash_out_payments = payments.cash_out
    # sum_of_cash_in_payments = cash_in_payments.pluck('sum(abs(amount))::float')
    # sum_of_cash_out_payments = cash_out_payments.pluck('sum(abs(amount))::float')
    sum_of_cash_in_payments = cash_in_payments.sum(:amount)
    sum_of_cash_out_payments = cash_out_payments.sum(:amount)
    balance = sum_of_cash_in_payments - sum_of_cash_out_payments
    balance
  end

  def amount_validation
    if self.amount < 0
      self.amount = self.amount.abs
    end
  end
end
