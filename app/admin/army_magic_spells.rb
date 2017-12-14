ActiveAdmin.register NinthAge::ArmyMagicSpell do
  menu parent: 'Ninth Age Army', priority: 2

  permit_params :name, :type_target, :duration, :locale, translations_attributes: [:id, :name, :description, :range, :casting_value, :effect, :locale, :_destroy]

  #config.sort_order = 'name_asc'

  filter :name

  before_action only: [:create, :update] do
    params[:ninth_age_army_magic_spell][:translations_attributes].each do |k, v|
      if v.except('id', 'locale').all? { |_, v| v.blank? }
        v.merge!(_destroy: '1')
        params[:ninth_age_army_magic_spell][:translations_attributes][k] = v
        v.each do |p|
          puts p
        end
      end
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :army
    actions
  end

  form do |f|
    f.inputs do
      f.input :army, collection: NinthAge::Army.order(:name)
      f.input :type_target
      f.input :duration
      f.translate_inputs do |t|
        t.input :name
        t.input :description
        t.input :range
        t.input :casting_value
        t.input :effect
      end
    end

    f.actions
  end

  show do |model|
    attributes_table do
      row :army
      rox :type_target
      rox :duration
    end
    panel 'Translations' do
      translate_attributes_table_for model do
        row :name
        row :description
        row :range
        row :casting_value
        row :effect
      end
    end
  end
end
