ActiveAdmin.register Payment do

  form title: 'Payment Create' do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Details of Payment' do

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

      f.input :user_id, as: :select, collection: User.all
      f.input :transaction_id
      f.input :payment_type, as: :select, collection: Payment::Payment_type
      f.input :amount
    end
    para "Press cancel to return to the list without saving."
    actions
  end

  permit_params :paymentable_id, :paymentable_type, :amount, :status, :transaction_id, :user_id, :payment_type
end
