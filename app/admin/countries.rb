ActiveAdmin.register Country do
  permit_params :name, :code, :description
end
