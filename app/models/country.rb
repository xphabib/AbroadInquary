# == Schema Information
#
# Table name: countries
#
#  id          :bigint           not null, primary key
#  code        :string
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Country < ApplicationRecord
  has_many :cities
  has_many :student_applications
  has_many :users
end
