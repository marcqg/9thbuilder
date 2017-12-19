ActiveAdmin.register NinthAge::SpecialRule do
  menu parent: 'Ninth Age Unit Specialisations', priority: 5

  permit_params :locale, :version_id, :army_id, :type_lvl, :position, translations_attributes: [:id, :name, :description, :locale, :_destroy]

  #config.sort_order = 'name_asc'

  filter :version, as: :select, collection: -> { NinthAge::Version.includes(:translations).map { |version| [ version.name, version.id ] } } 
  filter :army, as: :select, collection: -> { NinthAge::Army.includes(:translations).map { |army| [ army.name + ' ' + army.version.name, army.id ] } } 
  filter :name

  before_action only: [:create, :update] do
    params[:ninth_age_special_rule][:translations_attributes].each do |k, v|
      if v.except('id', 'locale').all? { |_, v| v.blank? }
        v.merge!(_destroy: '1')
        params[:ninth_age_special_rule][:translations_attributes][k] = v
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
    column :description
    column :army
    column :version
    actions
  end

  form do |f|
    f.inputs do
      f.input :version, collection: NinthAge::Version.includes(:translations).order(:name)
      f.input :army, as: :select,  :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/version-:ninth_age_special_rule_version_id/armies', 'data-option-observed' => 'ninth_age_special_rule_version_id'}, :collection => (resource.army ? resource.version.armies.collect {|army| [army.name, army.id]} : []), include_blank: true
      f.input :type_lvl, as: :select, collection: NinthAge::SpecialRule.type_lvls.keys.collect { |type_lvl| [I18n.t("special_rule.type_lvl.#{type_lvl}", default: type_lvl), type_lvl] }, include_blank: false, include_hidden: false
      f.translate_inputs do |t|
        t.input :name
        t.input :description
      end
    end

    f.actions
  end

  show do |model|
    attributes_table do
      row :version
      row :army
      row :type_lvl
    end
    panel 'Translations' do
      translate_attributes_table_for model do
        row :name
        row :description
      end
    end
  end
end
