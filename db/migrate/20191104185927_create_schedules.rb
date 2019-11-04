class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :mentor_id
      t.string :created_by
      t.integer :user_id
      t.string :status
      t.integer :student_id
      t.boolean :is_paid
      t.float :schedule_cost

      t.timestamps
    end
  end
end
