ActiveAdmin.register NinthAge::Army do
  menu parent: 'Ninth Age Army', priority: 2

  permit_params :version_id, :is_official, :logo, :logo_large, :latex_key, :locale, translations_attributes: [:id, :name, :locale, :_destroy]

  filter :version, as: :select, collection: -> { NinthAge::Version.includes(:translations).map { |version| [ version.name, version.id ] } } 
  
  controller do
    def scoped_collection
      end_of_association_chain.includes(:translations).includes(version: [:translations])
    end
  end
  
  before_action only: [:create, :update] do
    params[:ninth_age_army][:translations_attributes].each do |k,v|
      if v.except('id', 'locale').all? { |_,v| v.blank? }
        v.merge!(_destroy: '1')
        params[:ninth_age_army][:translations_attributes][k] = v
        v.each do |p|
          puts p
        end
      end
    end
  end

  before_action :only => [:index] do
    if params['version_id'].blank? && params['q'].blank? && params[:scope].blank?
       #country_contains or country_eq .. or depending of your filter type
       params['q'] = {:version_id_eq => NinthAge::Version.last.id } 
    end
  end

  member_action :duplicate, method: :post do
    new_army = resource.duplicate
    new_army.save

    redirect_to admin_ninth_age_army_url(new_army)
  end

  action_item :duplicate, only: :show do
    link_to 'Duplicate Ninth Age Army', duplicate_admin_ninth_age_army_path(ninth_age_army), method: :post
  end

  action_item :show_unit, only: :show do
    link_to 'Show', ninth_age_units_by_army_path(ninth_age_army), :target => "_blank"
  end

  index do
    selectable_column
    id_column
    column :name
    column :version, sortable: :version_id
    column :is_official
    actions
  end

  form do |f|
    f.inputs do
      f.input :version, collection: NinthAge::Version.includes(:translations).order(:name)
      f.input :is_official
      f.input :latex_key
      f.inputs 'Portrait' do
        f.input :logo, as: :file
      end
      f.inputs 'Thumb' do
        f.input :logo_large, as: :file
      end
      f.translate_inputs do |t|
        t.input :name
      end
    end

    f.actions
  end

  show do |model|
    attributes_table do
      row :version
      row :is_official
      row :latex_key
      row :logo do |ad|
        image_tag ad.medium_logo_url
      end
      row :logo_large do |ad|
        image_tag ad.medium_logo_large_url
      end
    end

    panel 'Translations' do
      translate_attributes_table_for model do
        row :name
      end
    end

    panel 'Units' do
      div class: 'units' do
        table_for model.units do
          column :id
          column :name
          column :position
          column do |unit|
            link_to 'Mont.', move_higher_admin_ninth_age_unit_path(unit), method: :post unless unit.first?
          end
          column do |unit|
            link_to 'Desc.', move_lower_admin_ninth_age_unit_path(unit), method: :post unless unit.last?
          end
          column do |unit|
            link_to 'Voir', admin_ninth_age_unit_path(unit), :target => "_blank"
          end
          column do |unit|
            link_to 'Edit', edit_admin_ninth_age_unit_path(unit), :target => "_blank"
          end
          column do |unit|
            link_to 'Delete', admin_ninth_age_unit_path(unit), :target => "_blank", method: :delete, data: { confirm: 'Are you sure?'}
          end
        end
      end
    end
  end

end
