# == Schema Information
#
# Table name: schedules
#
#  id            :bigint           not null, primary key
#  start_time    :datetime
#  end_time      :datetime
#  mentor_id     :integer
#  created_by    :string
#  user_id       :integer
#  status        :string
#  student_id    :integer
#  is_paid       :boolean
#  schedule_cost :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Schedule < ApplicationRecord
  has_many :payments, as: :paymentable
  belongs_to :student, class_name: 'User', optional: true
  belongs_to :mentor, class_name: 'User'
  scope :mentor_schedules, -> { where.not(mentor_id: nil) }
  scope :student_schedules, -> { where.not(student_id: nil) }
  scope :todays_schedules, -> { where("updated_at = ?", Date.today) }




end
