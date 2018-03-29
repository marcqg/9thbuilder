ActiveAdmin.register NinthAge::DomainMagic do
  menu parent: 'Ninth Age Magic', priority: 1

  permit_params :name, :version_id, :logo, :locale, :latex_key, translations_attributes: [:id, :name, :description, :locale, :_destroy]
  
  controller do
    def scoped_collection
      end_of_association_chain.includes(:translations).includes(version: [:translations])
    end
  end

  before_action only: [:create, :update] do
    params[:ninth_age_domain_magic][:translations_attributes].each do |k, v|
      if v.except('id', 'locale').all? { |_, v| v.blank? }
        v.merge!(_destroy: '1')
        params[:ninth_age_domain_magic][:translations_attributes][k] = v
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
      f.input :version, collection: NinthAge::Version.includes(:translations).order(:name)
      f.inputs 'Logo' do
        f.input :logo, as: :file
      end
      f.translate_inputs do |t|
        t.input :name
        t.input :description
      end
      f.input :latex_key
    end

    f.actions
  end

  show do |model|
    attributes_table do
      row :version
      row :latex_key
      row :logo do |ad|
        image_tag ad.medium_logo_url
      end
    end
    panel 'Translations' do
      translate_attributes_table_for model do
        row :name
        row :description
      end
    end
  end
end
