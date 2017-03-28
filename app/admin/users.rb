ActiveAdmin.register User do
  menu priority: 9

  filter :email
  filter :name

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
    f.inputs 'User Details' do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :roles, as: :check_boxes
    end
    f.actions
  end

  # Allow form to be submitted without a password
  controller do
    def update
      if params[:user][:password].blank?
        params[:user].delete 'password'
        params[:user].delete 'password_confirmation'
      end

      super
    end
  end

end
