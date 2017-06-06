ActiveAdmin.register NinthAge::MagicItem do
  menu parent: 'Ninth Age Magic', priority: 4

  permit_params :army_id, :magic_item_category_id, :override_id, :locale, :value_points, :is_multiple, translations_attributes: [:id, :name, :locale, :_destroy]

  controller do
    def create
      create! { new_admin_magic_item_url }
    end
  end

  action_item :new, only: :show do
    link_to 'New Magic Item', new_admin_ninth_age_magic_item_path
  end

  filter :army
  filter :magic_item_category
  filter :value_points
  filter :is_multiple

  index do
    selectable_column
    id_column
    column :army, sortable: :army_id
    column :magic_item_category, sortable: :magic_item_category_id
    column :name
    column :value_points
    column :is_multiple
    actions
  end

  form do |f|
    f.inputs do
      f.input :army, collection: NinthAge::Army.order(:name)
      f.input :magic_item_category, collection: NinthAge::MagicItemCategory.order(:name)
      f.input :override, collection: NinthAge::MagicItem.where(army_id: nil).order(:name)
      f.translate_inputs do |t|
        t.input :name
        t.input :description
      end
      f.input :value_points
      f.input :is_multiple
    end
    f.actions
  end

  show do |model|
    attributes_table do
      row :army
      row :magic_item_category
      row :override
      row :value_points
      row :is_multiple
    end
    panel 'Translations' do
      translate_attributes_table_for model do
        row :name
      end
    end
  end
end
