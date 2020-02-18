# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  about                  :text
#  address                :text
#  admin_confirmation     :boolean          default(FALSE)
#  cgpa                   :float
#  city_name              :string
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
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
#  role                   :integer
#  slug                   :string
#  university             :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  city_id                :integer
#  country_id             :integer
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_slug                  (slug) UNIQUE
#

class User < ApplicationRecord
  has_many :student_applications, foreign_key: :student_id
  has_many :mentor_applications, class_name: 'StudentApplication', foreign_key: :mentor_id
  belongs_to :city, optional: true
  belongs_to :country
  has_many :student_schedules, foreign_key: :student_id, class_name: 'Schedule'
  has_many :mentor_schedules, foreign_key: :mentor_id, class_name: 'Schedule'
  has_many :comments
  scope :students, -> { where(role: 'student') }
  scope :admins, -> { where.not(role: 'student') }
  scope :mentors, -> { where(role: 'mentor') }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  mount_uploader :image, AvatarUploader
  extend FriendlyId
  friendly_id :full_name, use: :slugged
  enum role: %i[head_admin teacher manager executive_admin director_admin mentor student]

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  private
  def self_type()

  end

end
