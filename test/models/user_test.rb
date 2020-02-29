# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  about                  :text
#  activities             :string
#  address                :text
#  admin_confirmation     :boolean          default(FALSE)
#  cgpa                   :float
#  city_name              :string
#  comment                :string
#  community              :string
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  consultancy            :string
#  country_name           :string
#  department_name        :string
#  dob                    :date
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  full_name              :string
#  image                  :string
#  last_name              :string
#  nationality            :string
#  nid                    :string
#  occupation             :string
#  other_consultancy      :string
#  other_working_policy   :string
#  passport               :string
#  phone                  :string
#  privacy_policy         :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer
#  scholarship            :string
#  skype                  :string
#  slug                   :string
#  social                 :string
#  university             :string
#  whatsapp               :string
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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
