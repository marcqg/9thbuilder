ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    @users = User.includes(:army_lists).sort do |b, a|
      a.army_lists.size <=> b.army_lists.size
    end
    
    columns do
      column do
        panel 'How to create a full stack Unit' do
          ol do
            li link_to 'New Unit', new_admin_ninth_age_unit_path
            li link_to 'New Troop', new_admin_ninth_age_troop_path
            li link_to 'New Equipment', new_admin_ninth_age_equipment_path
            li link_to 'New Special Rule', new_admin_ninth_age_special_rule_path
            li link_to 'New Unit Option', new_admin_ninth_age_unit_option_path
          end
        end # panel
      end # column

      column do
        panel 'Top 10 users' do
          table_for @users[0..9] do
            column 'Name' do |user|
              link_to user.name, admin_user_path(user)
            end
            column 'Army lists count' do |user|
              user.army_lists.size.to_s
            end
          end
        end # panel
      end # column
    end # columns
  end # content
end
