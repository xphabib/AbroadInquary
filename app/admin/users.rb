ActiveAdmin.register User do
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :first_name, :last_name, :phone, :city_id, :country_name, :city_name, :department_name, :university, :cgpa, :nationality, :occupation, :image, :dob, :nid, :address, :passport, :slug, :type
end
