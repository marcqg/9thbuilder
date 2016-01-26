ActiveAdmin.register Army do
  menu priority: 2

  permit_params :name

  config.sort_order = 'name_asc'

  filter :name

  member_action :duplicate, method: :post do
    new_army = resource.duplicate
    new_army.save

    redirect_to edit_admin_army_url(new_army)
  end

  action_item :duplicate, only: :show do
    link_to 'Duplicate Army', duplicate_admin_army_path(army), method: :post
  end
end
