ActiveAdmin.register NinthAge::ExtraItem do
  menu parent: 'Ninth Age Unit Specialisations', priority: 4

  permit_params :extra_item_category_id, :value_points, :max, :extra_item_activator_id, :latex_key, :locale, translations_attributes: [:id, :name, :description, :infos, :locale, :_destroy]

  filter :extra_item_category, as: :select, collection: -> { NinthAge::ExtraItemCategory.includes(:translations).includes(version: [:translations]).includes(army: [:translations]).map { |category| [ "#{category.army.name}(#{category.version.name}) - #{category.name}", category.id ] } } 
  filter :value_points

  controller do
    def scoped_collection
      end_of_association_chain.includes(:translations).includes(extra_item_category: [:translations])
    end

    def create
      create! { new_admin_ninth_age_extra_item_url }
    end
  end

  before_action only: [:create, :update] do
    params[:ninth_age_extra_item][:translations_attributes].each do |k, v|
      if v.except('id', 'locale').all? { |_, v| v.blank? }
        v.merge!(_destroy: '1')
        params[:ninth_age_extra_item][:translations_attributes][k] = v
        v.each do |p|
          puts p
        end
      end
    end
  end

  action_item :new, only: :show do
    link_to 'New Ninth Age Extra Item', new_admin_ninth_age_extra_item_path
  end

  index do
    selectable_column
    id_column
    column :extra_item_category, sortable: :extra_item_category_id
    column :name
    column :value_points
    actions
  end

  form do |f|
    f.inputs do
      f.input :extra_item_category, collection: NinthAge::ExtraItemCategory.includes(:translations).includes(:army).order(:name).collect { |ei| [ei.army.name + ' - ' + ei.army.version.name + ' - ' + ei.name, ei.id] }
      f.input :value_points
      f.input :max
      f.input :extra_item_activator, as: :select, include_blank: true,  :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/army-extra-item-category-:ninth_age_extra_item_extra_item_category_id/extra_items', 'data-option-observed' => 'ninth_age_extra_item_extra_item_category_id'}, :collection => (resource.extra_item_category ? resource.extra_item_category.army.extra_items.collect {|extra_item| [extra_item.name, extra_item.id]} : [])
      f.translate_inputs do |t|
        t.input :name
        t.input :description
        t.input :infos
      end
      f.input :latex_key
    end
    f.actions
  end

  show do |model|
    attributes_table do
      row :extra_item_category
      row :value_points
      row :max
      row :extra_item_activator
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
