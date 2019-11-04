class CreateApplicationAdditionalFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :application_additional_files do |t|
      t.integer :application_id
      t.string :file_type
      t.string :file_name

      t.timestamps
    end
  end
end
