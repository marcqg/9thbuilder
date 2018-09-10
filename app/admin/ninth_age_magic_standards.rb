ActiveAdmin.register NinthAge::MagicStandard do
  menu parent: 'Ninth Age Magic', priority: 5

  permit_params :version_id, :army_id, :organisation_id, {:organisation_ids => []}, :override_id, :locale, :value_points, :latex_key, :max, translations_attributes: [:id, :name, :description, :infos, :locale, :_destroy]

  filter :version, as: :select, collection: -> { NinthAge::Version.includes(:translations).map { |version| [ version.name, version.id ] } } 
  filter :army, as: :select, :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/version-:q_version_id/armies', 'data-option-observed' => 'q_version_id'}, collection: -> { NinthAge::Army.where(:version_id => NinthAge::Version.last.id).includes(:translations).map { |army| [ army.name, army.id ] } } 
  filter :army_null, as: :check_boxes, collection: [['Without army', true]], label: ''
  #filter :search_label_cont, label: 'Name search'
  filter :value_points
  
  controller do
    def scoped_collection
      end_of_association_chain.includes(:translations).includes(version: [:translations]).includes(army: [:translations])
    end
    def create
      create! { new_admin_ninth_age_magic_standard_url }
    end
  end

  before_action :only => [:index] do
    if params['version_id'].blank? && params['q'].blank? && params[:scope].blank?
       #country_contains or country_eq .. or depending of your filter type
       params['q'] = {:version_id_eq => NinthAge::Version.last.id } 
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

  index do
    selectable_column
    id_column
    column :army, sortable: :army_id
    column :name
    column :value_points
    column :version, sortable: :version_id
    actions
  end

  form do |f|
    f.inputs do
      f.input :version, collection: NinthAge::Version.includes(:translations).order(:name)
      f.input :army, as: :select, :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/version-:ninth_age_magic_standard_version_id/armies', 'data-option-observed' => 'ninth_age_magic_standard_version_id'}, :collection => (resource.version ? resource.version.armies.order(:name).collect {|army| [army.name, army.id]} : [])
      f.input :organisation, as: :select, :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/army-:ninth_age_magic_standard_army_id/organisations', 'data-option-observed' => 'ninth_age_magic_standard_army_id'}, :collection => (resource.army ? resource.army.organisations.order(:name).collect {|organisation| [organisation.name, organisation.id]} : [])
      f.input :organisation_ids, as: :select, multiple: true, include_blank: true,  :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/army-:ninth_age_magic_standard_army_id/organisations', 'data-option-observed' => 'ninth_age_magic_standard_army_id'}, :collection => (resource.army ? resource.army.organisations.collect {|organisation| [organisation.name, organisation.id]} : [])
      f.input :override, collection: NinthAge::MagicStandard.includes(:translations).where(army_id: nil).order(:name)
      f.translate_inputs do |t|
        t.input :name
        t.input :description
        t.input :infos
      end
      f.input :value_points
      f.input :max
      f.input :latex_key
    end
    f.actions
  end

  show do |model|
    attributes_table do
      row :version
      row :army
      row :organisation
      row :organisations do |organisation|
        organisation.name
      end
      row :override
      row :value_points
      row :max
      row :latex_key
    end
    panel 'Translations' do
      translate_attributes_table_for model do
        row :name
        row :description
        row :infos
      end
    end
  end
end
