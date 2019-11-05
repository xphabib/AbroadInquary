# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#  phone                  :string
#  city_id                :integer
#  country_name           :string
#  city_name              :string
#  department_name        :string
#  university             :string
#  cgpa                   :float
#  nationality            :string
#  occupation             :string
#  user_type              :string
#  role                   :string
#  image                  :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image, AvatarUploader

  ROLE = {
      head_admin: :head_admin,
      mentor: :mentor,
      executive_admin: :executive_admin,
      director_admin: :director_admin,
      meontor: :mentor,
      sudent: :student,
      parent: :parent
  }

end
