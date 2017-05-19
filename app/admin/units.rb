ActiveAdmin.register NinthAge::Unit do
  menu parent: 'Ninth Age Army', priority: 7

  permit_params :army_id, :locale, :value_points, :min_size, :max_size, :magic, :notes, :is_unique, translations_attributes: [:id, :name, :locale, :_destroy]

  controller do
    def create
      create! { new_admin_ninth_age_unit_url }
    end
  end

  member_action :duplicate, method: :post do
    new_unit = resource.duplicate
    new_unit.save

    redirect_to edit_admin_ninth_age_unit_url(new_unit)
  end

  action_item :new, only: :show do
    link_to 'New Unit', new_admin_ninth_age_unit_path
  end

  action_item :duplicate, only: :show do
    link_to 'Duplicate Unit', duplicate_admin_ninth_age_unit_path(ninth_age_unit), method: :post
  end

  filter :army
  filter :unit_category
  filter :value_points

  index do
    selectable_column
    id_column
    column :army, sortable: :army_id
    column :name
    column :min_size
    column :max_size
    column :value_points
    column :is_unique
    column :is_mount
    actions
  end

  form do |f|
    f.inputs do
      f.input :army, collection: NinthAge::Army.order(:name)
      f.input :organisation_ids, as: :select, collection: NinthAge::Organisation.includes(:army).collect { |o| [o.army.name + ' - ' + o.name, o.id] }, multiple: true
      f.input :value_points
      f.input :min_size
      f.input :max_size
      f.input :magic
      f.input :notes
      f.input :is_unique
      f.input :is_mount
      f.translate_inputs do |t|
        t.input :name
      end
    end
    f.actions
  end

  show do |model|
    attributes_table do
      row :id
      row :army
      row :organisations do |organisation|
        organisation.name
      end
      row :min_size
      row :max_size
      row :value_points
      row :magic
      row :notes
      row :is_unique
      row :is_mount
    end
    panel 'Translations' do
      translate_attributes_table_for model do
        row :name
      end
    end

    panel 'Troops details' do
      div class: 'unit_troops_details' do
        table_for model.troops do
          column :id
          column :troop_type
          column :name
          column :M
          column :WS
          column :BS
          column :S
          column :T
          column :W
          column :I
          column :A
          column :LD
          column :value_points
          column :min_size
          column :unit_option
          column :position
          column do |troop|
            link_to 'Mont.', move_higher_admin_ninth_age_troop_path(troop), method: :post unless troop.first?
          end
          column do |troop|
            link_to 'Desc.', move_lower_admin_ninth_age_troop_path(troop), method: :post unless troop.last?
          end
          column do |troop|
            link_to 'Voir', admin_ninth_age_troop_path(troop)
          end
        end
      end
    end

    panel 'Equipments Details' do
      div class: 'unit_equipments_details' do
        table_for model.equipment_unit_troops, 'data-url' => sort_admin_ninth_age_equipment_unit_troops_path(unit_id: model) do
          column :id
          column do |equipment_unit_troop|
            equipment_unit_troop.equipment.name
          end
          column :troop
          column :position
          column do |equipment_unit_troop|
            link_to 'Mont.', move_higher_admin_ninth_age_equipment_unit_troop_path(equipment_unit_troop), method: :post unless equipment_unit_troop.first?
          end
          column do |equipment_unit_troop|
            link_to 'Desc.', move_lower_admin_ninth_age_equipment_unit_troop_path(equipment_unit_troop), method: :post unless equipment_unit_troop.last?
          end
          column do |equipment_unit_troop|
            link_to 'Voir', admin_ninth_age_equipment_path(equipment_unit_troop)
          end
        end
      end
    end

    panel 'Special Rules Details' do
      div class: 'unit_special_rules_details' do
        table_for model.special_rule_unit_troops, 'data-url' => sort_admin_ninth_age_special_rule_unit_troops_path(unit_id: model) do
          column :id
          column do |special_rule_unit_troop|
            special_rule_unit_troop.special_rule.name
          end
          column :troop
          column :position
          column do |special_rule_unit_troop|
            link_to 'Mont.', move_higher_admin_ninth_age_special_rule_unit_troop_path(special_rule_unit_troop), method: :post unless special_rule_unit_troop.first?
          end
          column do |special_rule_unit_troop|
            link_to 'Desc.', move_lower_admin_ninth_age_special_rule_unit_troop_path(special_rule_unit_troop), method: :post unless special_rule_unit_troop.last?
          end
          column do |special_rule_unit_troop|
            link_to 'Voir', admin_ninth_age_special_rule_path(special_rule_unit_troop.special_rule)
          end
        end
      end
    end

    panel 'Options Details' do
      div class: 'unit_unit_options_details' do
        table_for model.unit_options do
          column :id
          column :name
          column :value_points
          column :is_per_model
          column :is_magic_items
          column :is_magic_standards
          column :is_extra_items
          column :is_unique_choice
          column :is_multiple
          column :mount
          column :position
          column do |unit_option|
            link_to 'Mont.', move_higher_admin_ninth_age_unit_option_path(unit_option), method: :post unless unit_option.first?
          end
          column do |unit_option|
            link_to 'Desc.', move_lower_admin_ninth_age_unit_option_path(unit_option), method: :post unless unit_option.last?
          end
          column do |unit_option|
            link_to 'Voir', admin_ninth_age_unit_option_path(unit_option)
          end
        end
      end
    end
  end
end
