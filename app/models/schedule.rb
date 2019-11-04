# == Schema Information
#
# Table name: schedules
#
#  id            :integer          not null, primary key
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
end
