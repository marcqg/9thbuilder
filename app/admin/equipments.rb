ActiveAdmin.register NinthAge::Equipment do
  menu parent: 'Ninth Age Unit Specialisations', priority: 1

  permit_params :name, :locale, :position, translations_attributes: [:id, :name, :description, :locale, :_destroy]

  #config.sort_order = 'name_asc'

  #filter :name
  filter :version, as: :select, collection: -> { NinthAge::Version.includes(:translations).map { |version| [ version.name, version.id ] } } 

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

  index do
    selectable_column
    id_column
    column :name, sortable: true
    column :description
    column :version, sortable: :version_id
    actions
  end

  form do |f|
    f.inputs do
      f.input :version, collection: NinthAge::Version.includes(:translations).order(:name), include_blank: false, include_hidden: false
      f.input :type_lvl, as: :select, collection: NinthAge::Equipment.type_lvls.keys.collect { |type_lvl| [I18n.t("special_rule.type_lvl.#{type_lvl}", default: type_lvl), type_lvl] }, include_blank: false, include_hidden: false
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

