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

require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
