ActiveAdmin.register NinthAge::ExtraItem do
  menu parent: 'Ninth Age Unit Specialisations', priority: 4

  permit_params :extra_item_category_id, :locale, translations_attributes: [:id, :name, :locale, :_destroy]

  # config.sort_order = 'name_asc'

  controller do
    def create
      create! { new_admin_ninth_age_extra_item_url }
    end
  end

  action_item :new, only: :show do
    link_to 'New Ninth Age Extra Item', new_admin_ninth_age_extra_item_path
  end

  filter :extra_item_category
  filter :value_points

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
      f.input :extra_item_category, collection: NinthAge::ExtraItemCategory.includes(:army).order(:name).collect { |ei| [ei.army.name + ' - ' + ei.name, ei.id] }
      f.input :value_points
      f.translate_inputs do |t|
        t.input :name
      end
    end
    f.actions
  end

  show do |model|
    attributes_table do
      row :extra_item_category
      row :value_points
    end
    panel 'Translations' do
      translate_attributes_table_for model do
        row :name
      end
    end
  end
end
