ActiveAdmin.register NinthAge::Troop do
  menu parent: 'Ninth Age Army', priority: 9

  permit_params :unit_id, :unit_option_id, :troop_type_id, :M, :WS, :BS, :S, :T, :W, :I, :A, :LD, :type_carac, :carac_att, :carac_of, :carac_str, :carac_ap, :carac_agi, :value_points, :min_size, :position, :locale, translations_attributes: [:id, :name, :locale, :_destroy]

  controller do
    def create
      create! { new_admin_ninth_age_troop_url }
    end
  end

  before_action only: [:create, :update] do
    params[:ninth_age_troop][:translations_attributes].each do |k, v|
      if v.except('id', 'locale').all? { |_, v| v.blank? }
        v.merge!(_destroy: '1')
        params[:ninth_age_troop][:translations_attributes][k] = v
        v.each do |p|
          puts p
        end
      end
    end
  end

  member_action :move_higher, method: :post do
    resource.move_higher
    resource.save

    redirect_to admin_ninth_age_unit_url(resource.unit)
  end

  member_action :move_lower, method: :post do
    resource.move_lower
    resource.save

    redirect_to admin_ninth_age_unit_url(resource.unit)
  end

  action_item :new, only: :show do
    link_to 'New Troop', new_admin_ninth_age_troop_path('troop[unit_id]' => ninth_age_troop.unit)
  end

  filter :unit
  filter :troop_type
  filter :value_points

  index do
    selectable_column
    id_column
    column :unit, sortable: :unit_id
    column :troop_type, sortable: :troop_type_id
    column :name
    column :unit_option, sortable: :unit_option_id
    column :value_points
    column :min_size
    column :position
    actions
  end

  form do |f|
    f.inputs do
      f.input :unit, collection: NinthAge::Unit.includes(:translations).includes(army: [:translations]).collect { |u| [u.army.name + ' - ' + u.army.version.name + ' - ' + u.name, u.id] }
      f.input :type_carac
      panel 'Carac V1' do
        div class: 'unit_carac_v1_details' do
          ol do 
            f.input :troop_type, collection: NinthAge::TroopType.includes(:translations).order(:name)
            f.input :M
            f.input :WS
            f.input :BS
            f.input :S
            f.input :T
            f.input :W
            f.input :I
            f.input :A
            f.input :LD
          end
        end
      end
      panel 'Carac V2' do
        div class: 'unit_carac_v2_details' do
          ol do 
            f.input :carac_att
            f.input :carac_of
            f.input :carac_str
            f.input :carac_ap
            f.input :carac_agi
          end
        end
      end

      f.input :value_points
      f.input :min_size
      f.input :position

      f.translate_inputs do |t|
        t.input :name
      end
    end
    f.actions
  end

  show do |model|
    h3 model.name
    attributes_table do
      row :unit
      row :troop_type
      row :unit_option
      row :value_points
    end
    panel 'Carac V1' do
      attributes_table do
        row :type_carac
        row :M
        row :WS
        row :BS
        row :S
        row :T
        row :W
        row :I
        row :A
        row :LD
      end
    end 
    panel 'Carac V2' do
        attributes_table do
        row :carac_att
        row :carac_of
        row :carac_str
        row :carac_ap
        row :carac_agi
        row :min_size
        row :position
      end
    end
    panel 'Translations' do
      translate_attributes_table_for model do
        row :name
      end
    end
  end
end
