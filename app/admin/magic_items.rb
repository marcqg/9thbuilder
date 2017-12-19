ActiveAdmin.register NinthAge::MagicItem do
  menu parent: 'Ninth Age Magic', priority: 4

  permit_params :version_id, :army_id, :magic_item_category_id, :override_id, :locale, :value_points, :is_multiple, :type_figurine, {:type_target => []}, {:duration => []}, :max, translations_attributes: [:id, :name, :locale, :_destroy]

  controller do
    def scoped_collection
      NinthAge::MagicItem.includes(:version)
    end
    def create
      create! { new_admin_magic_item_url }
    end
  end 

  action_item :new, only: :show do
    link_to 'New Magic Item', new_admin_ninth_age_magic_item_path
  end

  filter :version_name
  filter :magic_item_category
  filter :value_points
  filter :is_multiple

  index do
    selectable_column
    id_column
    column :name
    column :version, sortable: :version_id
    column :army, sortable: :army_id
    column :magic_item_category, sortable: :magic_item_category_id
    column :value_points
    column :is_multiple
    actions
  end

  form do |f|
    f.inputs do
      f.input :version, collection: NinthAge::Version.includes(:translations).order(:name)
      f.input :army, as: :select,  :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/version-:ninth_age_magic_item_version_id/armies', 'data-option-observed' => 'ninth_age_magic_item_version_id'}, :collection => (resource.army ? resource.version.armies.collect {|army| [army.name, army.id]} : []), include_blank: true
      f.input :magic_item_category, collection: NinthAge::MagicItemCategory.includes(:translations).order(:name)
      f.input :override, collection: NinthAge::MagicItem.includes(:translations).where(army_id: nil).order(:name)
      f.translate_inputs do |t|
        t.input :name
        t.input :description
      end
      f.input :value_points
      f.input :is_multiple
      f.input :type_figurine, as: :select, collection: NinthAge::MagicItem.type_figurines.keys.collect { |type_figurine| [I18n.t("magic_items.type_figurine.#{type_figurine}", type_figurine: type_figurine), type_figurine] }, include_blank: false, include_hidden: false
      f.input :type_target, as: :check_boxes, collection: NinthAge::MagicItem.values_for_type_target.collect { |type_target| [I18n.t("magic_spell.type_target.#{type_target}", default: type_target), type_target] }
      f.input :type_duration, as: :check_boxes, collection: NinthAge::MagicItem.values_for_type_duration.collect { |duration| [I18n.t("magic_spell.duration.#{duration}", default: duration), duration] }
      f.input :max
    end
    f.actions
  end

  show do |model|
    attributes_table do
      row :version
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
