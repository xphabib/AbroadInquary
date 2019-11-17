ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :full_name, :image, :gender

  index do
    selectable_column
    id_column
    column :full_name
    column :email
    column :gender
    column "Image" do |img|
      image_tag img.image_url, width: 50 if img.image.present?
    end
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :full_name
      f.input :email
      f.input :gender
      f.input :image, :as => :file
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
