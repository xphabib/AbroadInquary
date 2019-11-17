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
#  title         :string
#  tw_link       :string
#  youtube_link  :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  admin_user_id :integer
#  category_id   :integer
#

class Blog < ApplicationRecord
  belongs_to :admin_user
  belongs_to :category
  has_many :comments
  mount_uploader :image , AvatarUploader
end
