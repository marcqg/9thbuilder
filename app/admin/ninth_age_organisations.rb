ActiveAdmin.register NinthAge::Organisation do
  menu parent: 'Ninth Age Army', priority: 5

  permit_params :army_id, :logo, :isSpecialRule, :locale, translations_attributes: [:id, :name, :locale, :_destroy]

  filter :army, as: :select, collection: -> { NinthAge::Army.includes(:translations).includes(version: [:translations]).map { |army| [ army.name + ' ' + army.version.name, army.id ] } }   
  
  controller do
    def scoped_collection
      end_of_association_chain.includes(:translations).includes(army: [:translations])
    end
  end

  before_action only: [:create, :update] do
    params[:ninth_age_organisation][:translations_attributes].each do |k, v|
      if v.except('id', 'locale').all? { |_, v| v.blank? }
        v.merge!(_destroy: '1')
        params[:ninth_age_organisation][:translations_attributes][k] = v
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
      f.input :army, collection: NinthAge::Army.includes(:translations).includes(:version).order(:name).collect { |o| [o.name + ' - ' + o.version.name, o.id] }, :prompt => true
      f.input :isSpecialRule
      f.translate_inputs do |t|
        t.input :name
      end
      f.inputs 'Logo' do
        f.input :logo, as: :file
      end
    end

    f.actions
  end

  show do |model|
    attributes_table do
      row :id
      row :army
      row :isSpecialRule
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
