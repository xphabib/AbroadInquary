class CreateStudentApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :student_applications do |t|
      t.integer :country_id
      t.string :desire_program
      t.string :passport_file
      t.string :motivation_letter
      t.string :recommendation_letter
      t.string :cv
      t.string :police_clearance_certificate
      t.string :birth_certificate
      t.string :bank_statement
      t.string :bank_solvency_certificate
      t.integer :student_id
      t.integer :mentor_id
      t.string :university_name
      t.string :application_status

      t.timestamps
    end
  end
end
