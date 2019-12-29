# == Schema Information
#
# Table name: schedules
#
#  id            :bigint           not null, primary key
#  created_by    :string
#  end_time      :datetime
#  is_paid       :boolean
#  schedule_cost :float
#  start_time    :datetime
#  status        :string
#  user_phone_no :string
#  user_skype    :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  mentor_id     :integer
#  student_id    :integer
#  user_id       :integer
#

require 'test_helper'

class ScheduleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
