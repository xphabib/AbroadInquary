class AddCountryOfOriginToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :country_of_origin, :string
  end
end
