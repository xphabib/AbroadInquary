# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :text
#  phone      :string
#  user_email :string
#  user_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  blog_id    :integer
#  user_id    :integer
#

class Comment < ApplicationRecord
  belongs_to :blog
  belongs_to :user, optional: true

end
