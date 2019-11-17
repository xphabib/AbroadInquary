class AddFullNameToAdminUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_users, :full_name, :string
    add_column :admin_users, :image, :string
    add_column :admin_users, :gender, :string
  end
end
