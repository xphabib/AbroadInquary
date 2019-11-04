# == Schema Information
#
# Table name: application_additional_files
#
#  id             :integer          not null, primary key
#  application_id :integer
#  file_type      :string
#  file_name      :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class ApplicationAdditionalFileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
