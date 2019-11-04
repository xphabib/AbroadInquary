class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.integer :paymentable_id
      t.string :paymentable_type
      t.float :amount
      t.string :status
      t.integer :transaction_id

      t.timestamps
    end
  end
end
