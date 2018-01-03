ActiveAdmin.register NinthAge::MagicStandard do
  menu parent: 'Ninth Age Magic', priority: 5

  permit_params :version_id, :army_id, :override_id, :locale, :value_points, :max, translations_attributes: [:id, :name, :locale, :_destroy]

  # config.sort_order = 'name_asc'
  
  filter :army, as: :select, collection: -> { NinthAge::Army.includes(:translations).map { |army| [ army.name + ' ' + army.version.name, army.id ] } } 
  filter :name

  controller do
    def create
      create! { new_admin_ninth_age_magic_standard_url }
    end
  end

  before_action only: [:create, :update] do
    params[:ninth_age_magic_standard][:translations_attributes].each do |k, v|
      if v.except('id', 'locale').all? { |_, v| v.blank? }
        v.merge!(_destroy: '1')
        params[:ninth_age_magic_standard][:translations_attributes][k] = v
        v.each do |p|
          puts p
        end
      end
    end
  end

  action_item :new, only: :show do
    link_to 'New Magic Standard', new_admin_ninth_age_magic_standard_url
  end

  filter :version
  filter :army, as: :select, collection: -> { NinthAge::Army.includes(:translations).map { |army| [ army.name + ' ' + army.version.name, army.id ] } } 
  filter :value_points

  index do
    selectable_column
    id_column
    column :army, sortable: :army_id
    column :name
    column :value_points
    column :version
    actions
  end

  form do |f|
    f.inputs do
      f.input :version, collection: NinthAge::Version.includes(:translations).order(:name)
      f.input :army, as: :select, :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/version-:ninth_age_magic_standard_version_id/armies', 'data-option-observed' => 'ninth_age_magic_standard_version_id'}, :collection => (resource.version ? resource.version.armies.order(:name).collect {|army| [army.name, army.id]} : [])
      f.input :override, collection: NinthAge::MagicStandard.includes(:translations).where(army_id: nil).order(:name)
      f.translate_inputs do |t|
        t.input :name
        t.input :description
      end
      f.input :value_points
      f.input :max
    end
    f.actions
  end

  show do |model|
    attributes_table do
      row :version
      row :army
      row :override
      row :value_points
      row :max
    end
    panel 'Translations' do
      translate_attributes_table_for model do
        row :name
        row :description
      end
    end
  end
end
