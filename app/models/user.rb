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
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image, AvatarUploader

  # enum :type %i[ 'head_admin' 'manager' 'executive_admin' 'director_admin' 'mentor' 'student' 'parent']
  extend FriendlyId
  friendly_id :full_name, use: :slugged

  ROLE = {
      'head admin': 'head_admin',
      manager: 'manager',
      executive_admin: 'executive_admin',
      director_admin: 'director_admin',
      mentor: 'Mentor',
      student: 'Student',
      parent: 'parent'
  }

  def mentor?
    self.type == User::ROLE[:mentor]? true : false
  end

  def student?
    self.type == User::ROLE[:student]? true : false
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  private
  def self_type()

  end

end
