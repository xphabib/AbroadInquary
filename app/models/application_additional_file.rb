# == Schema Information
#
# Table name: application_additional_files
#
#  id             :bigint           not null, primary key
#  application_id :integer
#  file_type      :string
#  file_name      :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class ApplicationAdditionalFile < ApplicationRecord
end
