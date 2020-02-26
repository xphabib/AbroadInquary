ActiveAdmin.register Blog do

  filter :title
  permit_params :title, :content, :short_body, :image, :admin_user_id, :category_id, :fb_link, :tw_link, :g_plus_link, :ln_link, :youtube_link


  form do |f|
    f.inputs "Blog" do
      f.input :title
      f.input :category
      f.input :image, :as => :file,
              :hint => 'Preferable Image dimension (1200/600)px'
      f.input :short_body
      f.input :content#,:as => :ckeditor#label: false
      f.input :admin_user_id,  :input_html => { :value => current_admin_user.id }, as: :hidden
      # f.cktext_area :content, ckeditor: {language: 'us', label: true, :ckeditor => {:toolbar => 'Full'}, removeDialogTabs: 'image:Upload'}
      f.input :fb_link, input_html: { placeholder: "example: facebook.com/username" }
      f.input :tw_link, input_html: { placeholder: "example: twitter.com/username" }
      f.input :ln_link, input_html: { placeholder: "example: linkedin.com/username" }
      f.input :g_plus_link
      f.input :youtube_link
    end

    f.actions
  end

  index do
    selectable_column
    id_column
    column :title
    column :content do |content|
      truncate(content.content, omision: "...", length: 200 , :escape => false)
    end
    column "Image" do |img|
      image_tag img.image_url, width: 50 if img.image.present?
    end
    column :created_at
    column :updated_at


    actions
  end

  show do
    attributes_table do
      row :image do |img|
        image_tag img.image_url, width: 350 if img.image.present?
      end
      row :title
      row :content do |txt|
        raw(txt.content)
      end
      row :fb_link
      row :tw_link
      row :g_plus_link
      row :ln_link
      row :youtube_link
    end

  end
end
