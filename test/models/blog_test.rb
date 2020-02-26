# == Schema Information
#
# Table name: blogs
#
#  id            :bigint           not null, primary key
#  content       :text
#  fb_link       :string
#  g_plus_link   :string
#  image         :string
#  ln_link       :string
#  short_body    :string
#  title         :string
#  tw_link       :string
#  youtube_link  :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  admin_user_id :integer
#  category_id   :integer
#

require 'test_helper'

class BlogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
