ActiveAdmin.register_page 'statistique' do

  menu priority: 2, label: proc { I18n.t('active_admin.statistique') }, :if => proc{ current_user.has_role? :administrator }

  controller do
    before_action :administrator_filter

    def administrator_filter
      raise ActionController::RoutingError.new('Not Found') unless current_user.has_role? :administrator
    end
  end

  content title: proc { I18n.t('active_admin.statistique') } do
    columns do
      column do
        panel 'Users create account' do
        	render partial:'user_creation'
        end # panel
      end # column

      column do
        panel 'Army list by army' do
          render partial:'army_list_creation'
        end # panel
      end # column
    end # columns
  end # content
end