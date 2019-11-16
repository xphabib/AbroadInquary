ActiveAdmin.register User do

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :phone
    column :department_name
    column :university
    column :cgpa
    column :occupation
    column :dob
    column :nid
    column :address
    column :city_name
    column :country_name
    actions
  end

  show do
    attributes_table do
      row :first_name
      row :last_name
      row :email
      row :phone
      row :department_name
      row :university
      row :cgpa
      row :occupation
      row :dob
      row :address
      row :city_name
      row :country_name
    end
  end

  form title: 'User Create' do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Details of User' do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :password
      f.input :phone
      f.input :department_name
      f.input :university
      f.input :cgpa
      f.input :occupation
      f.input :dob
      f.input :address
      f.input :city_name
      f.input :country_name
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


  permit_params :email, :password, :first_name, :last_name, :phone, :city_id, :country_name, :city_name, :department_name, :university, :cgpa, :nationality, :occupation, :image, :dob, :nid, :address, :passport, :slug, :role
end
