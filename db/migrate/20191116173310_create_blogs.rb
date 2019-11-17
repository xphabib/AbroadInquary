class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :content
      t.string :image
      t.string :fb_link
      t.string :tw_link
      t.string :g_plus_link
      t.string :ln_link
      t.string :youtube_link
      t.integer :admin_user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
