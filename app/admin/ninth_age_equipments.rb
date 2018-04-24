ActiveAdmin.register NinthAge::Equipment do
  menu parent: 'Ninth Age Unit Specialisations', priority: 1

  permit_params :name, :locale, :version_id, :army_id, :type_lvl, :position, :latex_key, translations_attributes: [:id, :name, :description, :locale, :_destroy]

  filter :version, as: :select, collection: -> { NinthAge::Version.includes(:translations).map { |version| [ version.name, version.id ] } } 
  filter :army, as: :select, :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/version-:q_version_id/armies', 'data-option-observed' => 'q_version_id'}, collection: -> { NinthAge::Army.where(:version_id => NinthAge::Version.last.id).includes(:translations).map { |army| [ army.name, army.id ] } } 
  filter :army_null, as: :check_boxes, collection: [['Without army', true]], label: ''
  
  controller do
    def scoped_collection
      end_of_association_chain.includes(:translations).includes(version: [:translations]).includes(army: [:translations])
    end
  end
  
  before_action only: [:create, :update] do
    params[:ninth_age_equipment][:translations_attributes].each do |k, v|
      if v.except('id', 'locale').all? { |_, v| v.blank? }
        v.merge!(_destroy: '1')
        params[:ninth_age_equipment][:translations_attributes][k] = v
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

  index do
    selectable_column
    id_column
    column :name, sortable: true
    column :description
    column :army, sortable: :army_id
    column :version, sortable: :version_id
    actions
  end

  form do |f|
    f.inputs do
      f.input :version, collection: NinthAge::Version.includes(:translations).order(:name), include_blank: false, include_hidden: false
      f.input :army, as: :select,  :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/version-:ninth_age_equipment_version_id/armies', 'data-option-observed' => 'ninth_age_equipment_version_id'}, :collection => (resource.version ? resource.version.armies.collect {|army| [army.name, army.id]} : []), include_blank: 'No Army'
      f.input :type_lvl, as: :select, collection: NinthAge::Equipment.type_lvls.keys.collect { |type_lvl| [I18n.t("special_rule.type_lvl.#{type_lvl}", default: type_lvl), type_lvl] }, include_blank: false, include_hidden: false
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
      row :army
      row :type_lvl
      row :latex_key
    end
    panel 'Translations' do
      translate_attributes_table_for model do
        row :name
        row :description
      end
    end
  end
end

