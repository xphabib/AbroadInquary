class CreateScholarships < ActiveRecord::Migration[5.2]
  def change
    create_table :scholarships do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
