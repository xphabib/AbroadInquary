class AddShortBodyToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :short_body, :string
  end
end
