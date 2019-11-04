class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone, :string
    add_column :users, :city_id, :integer
    add_column :users, :country_name, :string
    add_column :users, :city_name, :string
    add_column :users, :department_name, :string
    add_column :users, :university, :string
    add_column :users, :cgpa, :float
    add_column :users, :nationality, :string
    add_column :users, :occupation, :string
    add_column :users, :user_type, :string
    add_column :users, :role, :string
  end
end
