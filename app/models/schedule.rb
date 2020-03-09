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
end
