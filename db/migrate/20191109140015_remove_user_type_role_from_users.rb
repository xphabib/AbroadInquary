class RemoveUserTypeRoleFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :user_type, :string
    remove_column :users, :role, :string
  end
end
