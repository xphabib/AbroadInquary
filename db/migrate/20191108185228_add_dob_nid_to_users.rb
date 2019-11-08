class AddDobNidToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :dob, :date
    add_column :users, :nid, :string
    add_column :users, :address, :text
    add_column :users, :passport, :string
  end
end
