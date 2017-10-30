ActiveAdmin.register NinthAge::Magic do
  menu parent: 'Ninth Age Magic', priority: 1

  permit_params :name, :version_id, :logo, :locale, translations_attributes: [:id, :name, :locale, :_destroy]

  #config.sort_order = 'name_asc'

  filter :name

  before_action only: [:create, :update] do
    params[:ninth_age_magic][:translations_attributes].each do |k, v|
      if v.except('id', 'locale').all? { |_, v| v.blank? }
        v.merge!(_destroy: '1')
        params[:ninth_age_magic][:translations_attributes][k] = v
        v.each do |p|
          puts p
        end
      end
    end
  end

  index do
    selectable_column
    id_column
    column :name
    actions
  end

  form do |f|
    f.inputs do
      f.input :version, collection: NinthAge::Version.order(:name)
      f.inputs 'Logo' do
        f.input :logo, as: :file
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
    end
    panel 'Translations' do
      translate_attributes_table_for model do
        row :name
      end
    end
  end
end
