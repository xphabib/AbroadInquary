# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
#
#

require 'faker'
40.times do |index|
  Student.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      city_name: Faker::Address.city,
      address: "#{Faker::Address.city}, #{Faker::Address.street_name}, #{Faker::Address.street_address}",
      cgpa: '3.22',
      country_name: Faker::Address.country,
      department_name: 'Bangla',
      dob: Faker::Date.in_date_period(year: 2000, month: 2),
      email: "student_#{index}@gmail.com",
      image: Faker::Avatar.image,
      nationality: 'Bangladeshi',
      nid: '111111',
      occupation: Faker::Company.profession,
      passport: '000000',
      phone: "0171000000#{index}",
      university: "City University",
      password: "111111",
  # city_id:

      )
  p "student_#{index}"

  Mentor.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      city_name: Faker::Address.city,
      address: "#{Faker::Address.city}, #{Faker::Address.street_name}, #{Faker::Address.street_address}",
      cgpa: '3.22',
      country_name: Faker::Address.country,
      department_name: 'Bangla',
      dob: Faker::Date.in_date_period(year: 2000, month: 2),
      email: "mentor_#{index}@gmail.com",
      image: Faker::Avatar.image,
      nationality: 'Bangladeshi',
      nid: '111111',
      occupation: Faker::Company.profession,
      passport: '000000',
      phone: "0171000000#{index}",
      university: "City University",
      password: "111111",
  # city_id:

      )
  p "mentor_#{index}"
  p "<<<<<<<<<<<<<<<<<<<<<#{index}>>>>>>>>>>>>>>>>>>>>>"
end