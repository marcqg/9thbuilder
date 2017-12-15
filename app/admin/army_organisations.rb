ActiveAdmin.register NinthAge::ArmyOrganisation do
  menu parent: 'Ninth Age Army', priority: 3

  permit_params :army_id, :locale, translations_attributes: [:id, :name, :description, :locale, :_destroy]

  #config.sort_order = 'name_asc'

  filter :army
  filter :name

  before_action only: [:create, :update] do
    params[:ninth_age_army_organisation][:translations_attributes].each do |k, v|
      if v.except('id', 'locale').all? { |_, v| v.blank? }
        v.merge!(_destroy: '1')
        params[:ninth_age_army_organisation][:translations_attributes][k] = v
        v.each do |p|
          puts p
        end
      end
    end
  end

  index do
    selectable_column
    id_column
    column :army, sortable: :army_id
    column :name
    actions
  end

  form do |f|
    f.inputs do
      f.input :army, collection: NinthAge::Army.includes(:translations).order(:name).collect { |o| [o.name + ' - ' + o.version.name, o.id] }, :prompt => true
      f.translate_inputs do |t|
        t.input :name
        t.input :description
      end
    end

    f.actions
  end

  show do |model|
    attributes_table do
      row :id
      row :army
    end
    panel 'Translations' do
      translate_attributes_table_for model do
        row :name
        row :description
      end
    end

    panel 'Organisation Details' do
      div class: 'organisations_details' do
        table_for model.organisation_groups do
          column :id
          column do |organisation_group|
            organisation_group.organisation.name
          end
          column :type_target
          column :target
          column do |organisation_group|
            link_to 'Voir', admin_ninth_age_organisation_group_path(organisation_group)
          end
        end
      end
    end
  end
end
