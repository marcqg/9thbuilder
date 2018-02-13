ActiveAdmin.register NinthAge::ExtraItemCategory do
  menu parent: 'Ninth Age Unit Specialisations', priority: 3

  permit_params :name, :locale, :version_id, :army_id, :is_unique, translations_attributes: [:id, :name, :locale, :_destroy]

  #config.sort_order = 'name_asc'

  filter :army, as: :select, collection: -> { NinthAge::Army.includes(:translations).map { |army| [ army.name + ' ' + army.version.name, army.id ] } } 
  filter :name

  before_action only: [:create, :update] do
    params[:ninth_age_extra_item_category][:translations_attributes].each do |k, v|
      if v.except('id', 'locale').all? { |_, v| v.blank? }
        v.merge!(_destroy: '1')
        params[:ninth_age_extra_item_category][:translations_attributes][k] = v
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
    column :army
    column :version
    actions
  end

  form do |f|
    f.inputs do
      f.input :version, collection: NinthAge::Version.includes(:translations).order(:name)
      f.input :army, as: :select, :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/version-:ninth_age_extra_item_category_version/armies', 'data-option-observed' => 'ninth_age_extra_item_category_version'}, :collection => (resource.version ? resource.version.armies.collect {|army| [army.name, army.id]} : [])
      f.input :is_unique
      f.translate_inputs do |t|
        t.input :name
      end
    end

    f.actions
  end

  show do |model|
    attributes_table do
      row :version
      row :army
      row :is_unique
    end
    panel 'Translations' do
      translate_attributes_table_for model do
        row :name
      end
    end
  end
end
