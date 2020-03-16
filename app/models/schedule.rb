# == Schema Information
#
# Table name: schedules
#
#  id                        :bigint           not null, primary key
#  apply_for_country         :string
#  cgpa                      :string
#  created_by                :string
#  end_time                  :datetime
#  english_proficiency_score :string
#  fund_spend                :string
#  is_paid                   :boolean
#  job_experience            :string
#  possible_questions        :string
#  publication               :string
#  schedule_cost             :float
#  start_time                :datetime
#  status                    :string
#  user_phone_no             :string
#  user_skype                :string
#  whatsapp                  :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  mentor_id                 :integer
#  student_id                :integer
#  user_id                   :integer
#

class Schedule < ApplicationRecord
  # has_many :payments, as: :paymentable
  belongs_to :student, class_name: 'User', optional: true
  belongs_to :mentor, class_name: 'User'
  scope :mentor_schedules, -> { where.not(mentor_id: nil) }
  scope :student_schedules, -> { where.not(student_id: nil) }
  scope :todays_schedules, -> { where("updated_at = ?", Date.today) }

  after_update :mentor_student_confirmation, if: :student_id

  def cancel
    self.update(
         apply_for_country: '',
         cgpa: '',
         created_by: '',
         english_proficiency_score: '',
         fund_spend: '',
         job_experience: '',
         possible_questions: '',
         publication: '',
         status: '',
         user_phone_no: '',
         user_skype: '',
         whatsapp: '',
         student_id: '',
    )
  end

  def mentor_student_confirmation
    start_time = self.start_time
    end_time = self.end_time
    schedule_cost = self.schedule_cost
    mentor_email = self.mentor.email
    student_email = self.student.email
    ScheduleMailer.mentor_confirmation(mentor_email, start_time, end_time, schedule_cost).deliver
    ScheduleMailer.student_confirmation(student_email, start_time, end_time, schedule_cost).deliver
  end

end
