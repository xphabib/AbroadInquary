class AddWhatsappToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :whatsapp, :string
    add_column :schedules, :cgpa, :string
    add_column :schedules, :english_proficiency_score, :string
    add_column :schedules, :publication, :string
    add_column :schedules, :job_experience, :string
    add_column :schedules, :fund_spend, :string
    add_column :schedules, :apply_for_country, :string
    add_column :schedules, :possible_questions, :string
  end
end
