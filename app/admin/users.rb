ActiveAdmin.register User do
  menu priority: 9

  filter :email
  filter :name

  permit_params :email, :password, :password_confirmation, role_ids: []

  index do
    selectable_column
    id_column
    column :email
    column :name
    column :favorite_army, sortable: :favorite_army_id
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :roles, as: :check_boxes
    end
    f.actions
  end

  show do
    attributes_table do
      row :email
      row :name
      row :favorite_army, sortable: :favorite_army_id
      row :created_at
      row :updated_at
      row :sign_in_count
      row :current_sign_in_at
      row :last_sign_in_at
      row :current_sign_in_ip
      row :last_sign_in_ip
      row :confirmed_at
      row :roles do |r|
        r.roles.map { |role| role.name }.join(", ")
      end
    end
  end

  # Allow form to be submitted without a password
  controller do
    def update
      if params[:user][:password].blank?
        params[:user].delete "password"
        params[:user].delete "password_confirmation"
      end

      super
    end
  end

end