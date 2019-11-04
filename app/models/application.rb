# == Schema Information
#
# Table name: applications
#
#  id                           :integer          not null, primary key
#  country_id                   :integer
#  desire_program               :string
#  passport_file                :string
#  motivation_letter            :string
#  recommendation_letter        :string
#  cv                           :string
#  police_clearance_certificate :string
#  birth_certificate            :string
#  bank_statement               :string
#  bank_solvency_certificate    :string
#  student_id                   :integer
#  mentor_id                    :integer
#  university_name              :string
#  application_status           :string
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

class Application < ApplicationRecord
end
