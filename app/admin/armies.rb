ActiveAdmin.register NinthAge::Army do
  menu parent: 'Ninth Age Army', priority: 2

  permit_params :version_id, :logo, :logo_large, :locale, translations_attributes: [:id, :name, :locale, :_destroy]

  #config.sort_order = 'name_asc'

  filter :name
  filter :version, as: :select, collection: -> { NinthAge::Version.includes(:translations).map { |version| [ version.name, version.id ] } } 
  
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

  member_action :duplicate, method: :post do
    new_army = resource.duplicate
    new_army.save

    redirect_to edit_admin_ninth_age_army_url(new_army)
  end

  action_item :duplicate, only: :show do
    link_to 'Duplicate Ninth Age Army', duplicate_admin_ninth_age_army_path(ninth_age_army), method: :post
  end

  index do
    selectable_column
    id_column
    column :name
    column :version, sortable: :version_id
    actions
  end

  form do |f|
    f.inputs do
      f.input :version, collection: NinthAge::Version.includes(:Translations).order(:name)
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
  end

end
