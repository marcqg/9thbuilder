ActiveAdmin.register NinthAge::Unit do
  menu parent: 'Ninth Age Army', priority: 7

  permit_params :army_id, :locale, :value_points, :min_size, :max_size, :magic, :notes, :max, :max_model, :order, :unit_type, :base, :organisation_ids, :unit_type_id, :size, :is_mount, :type_carac, :carac_ground_adv, :carac_ground_mar, :carac_fly_adv, :carac_fly_mar, :carac_dis, :carac_evoked, :carac_hp, :carac_def, :carac_res, :carac_as, :carac_spe, translations_attributes: [:id, :name, :locale, :_destroy]

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

  action_item :new_unit_option, only: :show do
    link_to 'New Unit Option', new_admin_ninth_age_unit_option_path('ninth_age_unit_option[unit_id]' => ninth_age_unit.id)
  end

  action_item :new_equipment, only: :show do
    link_to 'New Equipment', new_admin_ninth_age_equipment_unit_troop_path('ninth_age_equipment_unit_troop[unit_id]' => ninth_age_unit.id)
  end

  action_item :new_special_rule, only: :show do
    link_to 'New Special Rule', new_admin_ninth_age_special_rule_unit_troop_path('ninth_age_special_rule_unit_troop[unit_id]' => ninth_age_unit.id)
  end

  filter :army, as: :select, collection: -> { NinthAge::Army.includes(:translations).map { |army| [ army.name + ' ' + army.version.name, army.id ] } } 
  filter :name

  index do
    selectable_column
    id_column
    column :army, sortable: :army_id
    column :name
    column :min_size
    column :max_size
    column :value_points
    column :max
    column :max_model
    column :unit_type
    column :base
    column :is_mount
    actions
  end

  form do |f|
    f.inputs do
      f.input :army, collection: NinthAge::Army.includes(:translations).includes(:version).order(:name).collect { |o| [o.name + ' - ' + o.version.name, o.id] }, :prompt => true
      f.input :organisation_ids, as: :select,  :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/army-:ninth_age_unit_army_id/organisations', 'data-option-observed' => 'ninth_age_unit_army_id'}, :collection => (resource.army ? resource.army.organisations.collect {|organisation| [organisation.name, organisation.id]} : [])
      f.translate_inputs do |t|
        t.input :name
      end
      f.input :unit_type, collection: NinthAge::UnitType.includes(:translations).order(:name)
      f.input :value_points
      f.input :min_size
      f.input :max_size
      f.input :max
      f.input :max_model
      f.input :magic
      f.input :notes
      f.input :order
      f.input :unit_type, collection: NinthAge::UnitType.includes(:translations).order(:name)
      f.input :base, as: :select, collection: NinthAge::Unit.bases.keys.collect { |base| [I18n.t("unit.base.#{base}", default: base.titleize), base] }, include_blank: false, include_hidden: false
      f.input :size, as: :select, collection: NinthAge::Unit.sizes.keys.collect { |size| [I18n.t("unit.size.#{size}", default: size.titleize), size] }, include_blank: false, include_hidden: false
      f.input :is_mount
      f.input :type_carac
      panel 'Carac V2' do
        div class: 'unit_carac_v2_details' do
          ol do 
            f.input :carac_ground_adv
            f.input :carac_ground_mar
            f.input :carac_fly_adv
            f.input :carac_fly_mar
            f.input :carac_dis
            f.input :carac_evoked
            f.input :carac_hp
            f.input :carac_def
            f.input :carac_res
            f.input :carac_as
            f.input :carac_spe
          end
        end
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
      row :unit_type
      row :min_size
      row :max_size
      row :value_points
      row :magic
      row :notes
      row :max
      row :max_model
      row :order
      row :unit_type
      row :base
      row :is_mount
      row :size
      row :type_carac
      row :carac_ground_adv
      row :carac_ground_mar
      row :carac_fly_adv
      row :carac_fly_mar
      row :carac_dis
      row :carac_evoked
      row :carac_hp
      row :carac_def
      row :carac_res
      row :carac_as
      row :carac_spe
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
          column :type_carac
          column :M
          column :WS
          column :BS
          column :S
          column :T
          column :W
          column :I
          column :A
          column :LD
          column :carac_att
          column :carac_of
          column :carac_str
          column :carac_ap
          column :carac_agi
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
          column do |troop|
            link_to 'Edit', edit_admin_ninth_age_troop_path(troop)
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
        table_for model.unit_options.order(:parent_id, position: :asc) do
          column :id
          column :parent_id
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
          column do |unit_option|
            link_to 'Edit', edit_admin_ninth_age_unit_option_path(unit_option)
          end
        end
      end
    end
  end
end
