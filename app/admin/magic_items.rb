ActiveAdmin.register NinthAge::MagicItem do
  menu parent: 'Ninth Age Magic', priority: 4

  permit_params :army_id, :magic_item_category_id, :override_id, :locale, :value_points, :is_multiple, :type_figurine, {:type_target => []}, {:duration => []}, :max, translations_attributes: [:id, :name, :locale, :_destroy]

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
      f.input :army, collection: NinthAge::Army.includes(:translations).includes(:version).order(:name).collect { |o| [o.name + ' - ' + o.version.name, o.id] }
      f.input :magic_item_category, collection: NinthAge::MagicItemCategory.includes(:translations).order(:name)
      f.input :override, collection: NinthAge::MagicItem.includes(:translations).where(army_id: nil).order(:name)
      f.translate_inputs do |t|
        t.input :name
        t.input :description
      end
      f.input :value_points
      f.input :is_multiple
      f.input :type_figurine
      f.input :type_target, as: :check_boxes, collection: NinthAge::MagicItem.values_for_type_target.collect { |type_target| [I18n.t("magic_spell.type_target.#{type_target}", default: type_target), type_target] }
      f.input :duration, as: :check_boxes, collection: NinthAge::MagicItem.values_for_duration.collect { |duration| [I18n.t("magic_spell.duration.#{duration}", default: duration), duration] }
      f.input :max
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
      row :type_figurine
      row :type_target
      row :type_duration
      row :max
    end
    panel 'Translations' do
      translate_attributes_table_for model do
        row :name
      end
    end
  end
end
