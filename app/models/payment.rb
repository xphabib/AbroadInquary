# == Schema Information
#
# Table name: payments
#
#  id               :bigint           not null, primary key
#  amount           :float
#  paymentable_type :string
#  status           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  paymentable_id   :integer
#  transaction_id   :integer
#  user_id          :integer
#

class Payment < ApplicationRecord
  belongs_to :paymentable, polymorphic: true
  belongs_to :user
end
