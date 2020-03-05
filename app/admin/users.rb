ActiveAdmin.register User do

  index do
    selectable_column
    id_column
    column :full_name
    column :email
    column :about
    column :activities
    column :address
    column :admin_confirmation
    column :cgpa
    column :city_name
    column :comment
    column :community
    column :confirmation_sent_at
    column :confirmation_token
    column :confirmed_at
    column :consultancy
    column :country_name
    column :country_of_origin
    column :department_name
    column :dob
    column :encrypted_password
    column :image
    column :nationality
    column :nid
    column :occupation
    column :other_consultancy
    column :other_working_policy
    column :passport
    column :phone
    column :privacy_policy
    column :remember_created_at
    column :reset_password_sent_at
    column :reset_password_token
    column :role
    column :scholarship
    column :skype
    column :slug
    column :social
    column :university
    column :whatsapp
    column :created_at
    column :updated_at
    column :city_id
    column :country_id

    column :login_as do |user|
      link_to "Login", login_as_admin_user_path(user)
    end
    column :lock_user do |user|
      if user.admin_confirmation
        link_to "Lock User", lock_user_admin_user_path(user)
      else
        link_to "Unlock User", unlock_user_admin_user_path(user)
      end
    end
    column :confirm_user do |user|
      if user.admin_confirmation
        "Confirmed"
      else
        link_to "Confirm User", confirm_user_admin_user_path(user)
      end
    end
    actions
  end

  show do
    attributes_table do
      row :full_name
      row :about
      row :activities
      row :address
      row :admin_confirmation
      row :cgpa
      row :city_name
      row :comment
      row :community
      row :confirmation_sent_at
      row :confirmation_token
      row :confirmed_at
      row :consultancy
      row :country_name
      row :country_of_origin
      row :department_name
      row :dob
      row :email
      row :encrypted_password
      row :image
      row :nationality
      row :nid
      row :occupation
      row :other_consultancy
      row :other_working_policy
      row :passport
      row :phone
      row :privacy_policy
      row :remember_created_at
      row :reset_password_sent_at
      row :reset_password_token
      row :role
      row :scholarship
      row :skype
      row :slug
      row :social
      row :university
      row :whatsapp
      row :created_at
      row :updated_at
      row :city_id
      row :country_id
    end
  end

  form title: 'User Create' do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Details of User' do
      f.input :full_name
      f.input :email
      f.input :password
      f.input :phone
      f.input :department_name
      f.input :country_id, as: :select, :collection => Country.all
      f.input :nationality
      f.input :university
      f.input :cgpa
      f.input :occupation
      f.input :dob, start_year: 1970
      f.input :nid
      f.input :address
      f.input :city_name
      f.input :country_of_origin
      f.input :country_name
      f.input :skype
      f.input :whatsapp
      f.input :scholarship
      f.input :social
      f.input :activities
      f.input :community
      f.input :consultancy
      f.input :other_consultancy
      f.input :comment
      f.input :privacy_policy
      f.input :other_working_policy
      f.input :passport
      f.input :role, as: :select, collection: ['head_admin', 'teacher', 'manager', 'executive_admin', 'director_admin', 'mentor', 'student']
    end
    para "Press cancel to return to the list without saving."
    actions
  end

  controller do
    def find_resource
      begin
        scoped_collection.where(slug: params[:id]).first!
      rescue ActiveRecord::RecordNotFound
        scoped_collection.find(params[:id])
      end
    end
  end

  member_action :login_as, :method => :get do
    # sign_out current_admin_user
    sign_in(:user, User.friendly.find(params[:id]), { :bypass => true })
    redirect_to root_path
  end

  member_action :confirm_user, :method => :get do
    user = User.friendly.find(params[:id])
    user.update(admin_confirmation: true)
    redirect_to admin_users_path
  end

  member_action :lock_user, :method => :get do
    user = User.friendly.find(params[:id])
    user.update(admin_confirmation: false)
    redirect_to admin_users_path
  end


  member_action :unlock_user, :method => :get do
    user = User.friendly.find(params[:id])
    user.update(admin_confirmation: true)
    redirect_to admin_users_path
  end

  permit_params :full_name, :email, :password, :phone, :department_name, :country_id, :country_of_origin, :nationality, :university, :cgpa, :occupation, :dob, :nid, :address, :city_name, :country_name, :skype, :whatsapp, :scholarship, :social, :activities, :community, :consultancy, :other_consultancy, :comment, :privacy_policy, :other_working_policy, :passport, :role
end
