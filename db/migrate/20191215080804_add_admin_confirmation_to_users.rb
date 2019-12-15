class AddAdminConfirmationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin_confirmation, :boolean, default: false
  end
end
