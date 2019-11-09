# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  address                :text
#  cgpa                   :float
#  city_name              :string
#  country_name           :string
#  department_name        :string
#  dob                    :date
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  image                  :string
#  last_name              :string
#  nationality            :string
#  nid                    :string
#  occupation             :string
#  passport               :string
#  phone                  :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  slug                   :string
#  type                   :string
#  university             :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  city_id                :integer
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_slug                  (slug) UNIQUE
#

class User < ApplicationRecord
  belongs_to :city, optional: true
  has_many :schedules
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image, AvatarUploader

  extend FriendlyId
  friendly_id :full_name, use: :slugged

  ROLE = {
      'head admin': 'head_admin',
      manager: 'manager',
      executive_admin: 'executive_admin',
      director_admin: 'director_admin',
      mentor: 'mentor',
      sudent: 'student',
      parent: 'parent'
  }

  def full_name
    "#{self.first_name} #{self.last_name} "
  end

end
