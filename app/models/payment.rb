# == Schema Information
#
# Table name: payments
#
#  id               :bigint           not null, primary key
#  paymentable_id   :integer
#  paymentable_type :string
#  amount           :float
#  status           :string
#  transaction_id   :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Payment < ApplicationRecord
  belongs_to :paymentable, polymorphic: true
end
