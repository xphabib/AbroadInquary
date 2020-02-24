class AddOtherColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :full_name, :string
    add_column :users, :scholarship, :string
    add_column :users, :social, :string
    add_column :users, :activities, :string
    add_column :users, :community, :string
    add_column :users, :consultancy, :string
    add_column :users, :other_consultancy, :string
    add_column :users, :comment, :string
    add_column :users, :privacy_policy, :string
    add_column :users, :other_working_policy, :string
  end
end
