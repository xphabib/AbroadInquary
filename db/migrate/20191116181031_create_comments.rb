class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :user_id
      t.integer :blog_id
      t.string :user_name
      t.string :user_email
      t.string :phone

      t.timestamps
    end
  end
end
