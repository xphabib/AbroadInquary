ActiveAdmin.register User do

  index do
    selectable_column
    id_column
    column :full_name
    column :email
    column :phone
    column :role
    column :department_name
    column :nationality
    column :university
    column :cgpa
    column :occupation
    column :dob
    column :nid
    column :address
    column :city_name
    column :country_name
    column :skype
    column :whatsapp
    column :scholarship
    column :social
    column :activities
    column :community
    column :consultancy
    column :other_consultancy
    column :comment
    column :privacy_policy
    column :other_working_policy
    column :passport
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
      row :email
      row :phone
      row :role
      row :department_name
      row :nationality
      row :university
      row :cgpa
      row :occupation
      row :dob
      row :nid
      row :address
      row :city_name
      row :country_name
      row :skype
      row :whatsapp
      row :scholarship
      row :social
      row :activities
      row :community
      row :consultancy
      row :other_consultancy
      row :comment
      row :privacy_policy
      row :other_working_policy
      row :passport
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
      f.input :dob
      f.input :nid
      f.input :address
      f.input :city_name
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

  permit_params :full_name, :email, :password, :phone, :department_name, :country_id, :nationality, :university, :cgpa, :occupation, :dob, :nid, :address, :city_name, :country_name, :skype, :whatsapp, :scholarship, :social, :activities, :community, :consultancy, :other_consultancy, :comment, :privacy_policy, :other_working_policy, :passport, :role
end
