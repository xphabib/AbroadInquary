# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
#  name       :string
#  code       :string
#
#
# require 'faker'
#
#   Country.create(
#       name:  'Bangladesh',
#       code: '880'
#   )
# Country.create(
#     name:  'Afghanistan',
#     code: '93'
# )
# Country.create(
#     name:  'Australia',
#     code: '61'
# )
#
# 40.times do |index|
#   User.create(
#       first_name: Faker::Name.first_name,
#       last_name: Faker::Name.last_name,
#       city_name: Faker::Address.city,
#       address: "#{Faker::Address.city}, #{Faker::Address.street_name}, #{Faker::Address.street_address}",
#       cgpa: '3.22',
#       country_name: Faker::Address.country,
#       department_name: 'Bangla',
#       dob: Faker::Date.in_date_period(year: 2000, month: 2),
#       email: "student_#{index}@gmail.com",
#       image: Faker::Avatar.image,
#       nationality: 'Bangladeshi',
#       nid: '111111',
#       occupation: Faker::Company.profession,
#       passport: '000000',
#       phone: "0171000000#{index}",
#       university: "City University",
#       password: "111111",
#       role: 'student'
#   # city_id:
#
#       )
#   p "student_#{index}"
#
#   User.create(
#       first_name: Faker::Name.first_name,
#       last_name: Faker::Name.last_name,
#       city_name: Faker::Address.city,
#       address: "#{Faker::Address.city}, #{Faker::Address.street_name}, #{Faker::Address.street_address}",
#       cgpa: '3.22',
#       country_name: Faker::Address.country,
#       department_name: 'Bangla',
#       dob: Faker::Date.in_date_period(year: 2000, month: 2),
#       email: "mentor_#{index}@gmail.com",
#       image: Faker::Avatar.image,
#       nationality: 'Bangladeshi',
#       nid: '111111',
#       occupation: Faker::Company.profession,
#       passport: '000000',
#       phone: "0171000000#{index}",
#       university: "City University",
#       password: "111111",
#       role: 'mentor'
#   # city_id:
#
#       )
#   p "mentor_#{index}"
#   p "<<<<<<<<<<<<<<<<<<<<<#{index}>>>>>>>>>>>>>>>>>>>>>"
# end