ActiveAdmin.register NinthAge::Unit do
  menu parent: 'Ninth Age Army', priority: 7

  permit_params :army_id, :locale, :value_points, :min_size, :max_size, :magic, :notes, :max, :max_model, :position, :unit_type, :base, {:organisation_ids => []}, :unit_type_id, :size, :is_mount, :type_carac, :carac_ground_adv, :carac_ground_mar, :carac_fly_adv, :carac_fly_mar, :carac_dis, :carac_evoked, :carac_hp, :carac_def, :carac_res, :carac_arm, translations_attributes: [:id, :name, :locale, :_destroy]

  controller do
    def create
      create! { new_admin_ninth_age_unit_url }
    end
  end

  before_action only: [:create, :update] do
    params[:ninth_age_unit][:translations_attributes].each do |k, v|
      if v.except('id', 'locale').all? { |_, v| v.blank? }
        v.merge!(_destroy: '1')
        params[:ninth_age_unit][:translations_attributes][k] = v
      end
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
    link_to 'Duplicate Unit', duplicate_admin_ninth_age_unit_path(ninth_age_unit), :target => "_blank", method: :post
  end

  action_item :new_troop, only: :show do
    link_to 'New Troop', new_admin_ninth_age_troop_path('ninth_age_troop[unit_id]' => ninth_age_unit.id), :target => "_blank"
  end

  action_item :new_organisation_change, only: :show do
    link_to 'New Organisation change', new_admin_ninth_age_organisation_change_path({'ninth_age_organisation_change[unit_id]' => ninth_age_unit.id}), :target => "_blank"
  end

  action_item :new_unit_option, only: :show do
    link_to 'New Unit Option', new_admin_ninth_age_unit_option_path('ninth_age_unit_option[unit_id]' => ninth_age_unit.id), :target => "_blank"
  end

  action_item :new_equipment, only: :show do
    link_to 'New Equipment', new_admin_ninth_age_equipment_unit_troop_path({'ninth_age_equipment_unit_troop[unit_id]' => ninth_age_unit.id, 'ninth_age_equipment_unit_troop[position]' => ninth_age_unit.equipment_unit_troops.size + 1}), :target => "_blank"
  end

  action_item :new_special_rule, only: :show do
    link_to 'New Special Rule', new_admin_ninth_age_special_rule_unit_troop_path({'ninth_age_special_rule_unit_troop[unit_id]' => ninth_age_unit.id, 'ninth_age_special_rule_unit_troop[position]' => ninth_age_unit.special_rule_unit_troops.size + 1}), :target => "_blank"
  end

  action_item :show_unit, only: :show do
    link_to 'Show', ninth_age_unit_path(ninth_age_unit), :target => "_blank"
  end

  filter :army, as: :select, collection: -> { NinthAge::Army.includes(:translations).map { |army| [ army.name + ' ' + army.version.name, army.id ] } } 
  filter :name
  filter :is_mount

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
    column :is_mount
    actions
  end

  form do |f|
    f.inputs do
      f.input :army, collection: NinthAge::Army.includes(:translations).includes(:version).order(:name).collect { |o| [o.name + ' - ' + o.version.name, o.id] }, :prompt => true
      f.input :organisation_ids, as: :select, multiple: true, include_blank: true,  :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/army-:ninth_age_unit_army_id/organisations', 'data-option-observed' => 'ninth_age_unit_army_id'}, :collection => (resource.army ? resource.army.organisations.collect {|organisation| [organisation.name, organisation.id]} : [])
      f.translate_inputs do |t|
        t.input :name
      end
      f.input :value_points
      f.input :min_size
      f.input :max_size
      f.input :max
      f.input :max_model
      f.input :magic
      f.input :notes
      f.input :position
      f.input :unit_type, collection: NinthAge::UnitType.includes(:translations).order(:name)
      f.input :base, as: :select, collection: NinthAge::Unit.bases.keys.collect { |base| [I18n.t("unit.base.#{base}", default: base.titleize), base] }, include_blank: false, include_hidden: false
      f.input :size, as: :select, collection: NinthAge::Unit.sizes.keys.collect { |size| [I18n.t("unit.size.#{size}", default: size.titleize), size] }, include_blank: false, include_hidden: false
      f.input :is_mount
      f.input :type_carac
      panel 'Carac V2', :id => 'ninth_age_unit_carac_v2'  do
        div class: 'unit_carac_v2_details' do
          ol do 
            f.input :carac_ground_adv
            f.input :carac_ground_mar
            f.input :carac_fly_adv
            f.input :carac_fly_mar
            f.input :carac_dis
            f.input :carac_evoked, label: 'Carac rea'
            f.input :carac_hp
            f.input :carac_def
            f.input :carac_res
            f.input :carac_arm
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
      row :position
      row :unit_type
      row :base
      row :is_mount
      row :size
      row :type_carac
    end 
    panel 'Carac V2', :id => 'ninth_age_unit_carac_v2', :class => 'ninth_age_unit_carac' do
      attributes_table do
        row :carac_ground_adv
        row :carac_ground_mar
        row :carac_fly_adv
        row :carac_fly_mar
        row :carac_dis
        row 'CARAC REA' do 
          model.carac_evoked
        end 
        row :carac_hp
        row :carac_def
        row :carac_res
        row :carac_arm
      end
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
            link_to 'Voir', admin_ninth_age_troop_path(troop), :target => "_blank"
          end
          column do |troop|
            link_to 'Edit', edit_admin_ninth_age_troop_path(troop), :target => "_blank"
          end
          column do |troop|
            link_to 'Delete', admin_ninth_age_troop_path(troop), :target => "_blank", method: :delete, data: { confirm: 'Are you sure?'}
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
            link_to 'Voir', admin_ninth_age_equipment_unit_troop_path(equipment_unit_troop), :target => "_blank"
          end
          column do |equipment_unit_troop|
            link_to 'Edit', edit_admin_ninth_age_equipment_unit_troop_path(equipment_unit_troop), :target => "_blank"
          end
          column do |equipment_unit_troop|
            link_to 'Delete', admin_ninth_age_equipment_unit_troop_path(equipment_unit_troop), :target => "_blank", method: :delete, data: { confirm: 'Are you sure?'}
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
            link_to 'Voir', admin_ninth_age_special_rule_unit_troop_path(special_rule_unit_troop), :target => "_blank"
          end
          column do |special_rule_unit_troop|
            link_to 'Edit', edit_admin_ninth_age_special_rule_unit_troop_path(special_rule_unit_troop), :target => "_blank"
          end
          column do |special_rule_unit_troop|
            link_to 'Delete', admin_ninth_age_special_rule_unit_troop_path(special_rule_unit_troop), :target => "_blank", method: :delete, data: { confirm: 'Are you sure?'}
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
          column :is_magic
          column :domain_magic
          column :mount
          column :position
          column do |unit_option|
            link_to 'Mont.', move_higher_admin_ninth_age_unit_option_path(unit_option), method: :post unless unit_option.first?
          end
          column do |unit_option|
            link_to 'Desc.', move_lower_admin_ninth_age_unit_option_path(unit_option), method: :post unless unit_option.last?
          end
          column do |unit_option|
            link_to 'Voir', admin_ninth_age_unit_option_path(unit_option), :target => "_blank"
          end
          column do |unit_option|
            link_to 'Edit', edit_admin_ninth_age_unit_option_path(unit_option), :target => "_blank"
          end
          column do |unit_option|
            link_to 'Delete', admin_ninth_age_unit_option_path(unit_option), :target => "_blank", method: :delete, data: { confirm: 'Are you sure?'}
          end
        end
      end
    end

    panel 'Organisation change Details' do
      div class: 'unit_organisation_change_details' do
        table_for model.organisation_changes do
          column :id
          column :default_organisation
          column :new_organisation
          column :type_target
          column :number
          column do |organisation_change|
            link_to 'Voir', admin_ninth_age_organisation_change_path(organisation_change), :target => "_blank"
          end
          column do |organisation_change|
            link_to 'Edit', edit_admin_ninth_age_organisation_change_path(organisation_change), :target => "_blank"
          end
          column do |organisation_change|
            link_to 'Delete', admin_ninth_age_organisation_change_path(organisation_change), :target => "_blank", method: :delete, data: { confirm: 'Are you sure?'}
          end
        end
      end
    end
  end
end
