ActiveAdmin.register NinthAge::DomainMagicSpell do
  menu parent: 'Ninth Age Magic', priority: 2

  permit_params :domain_magic_id, {:type_target => []}, {:duration => []}, :locale, translations_attributes: [:id, :name, :range, :casting_value, :effect, :locale, :_destroy]

  #config.sort_order = 'name_asc'

  filter :name

  before_action only: [:create, :update] do
    params[:ninth_age_domain_magic_spell][:translations_attributes].each do |k, v|
      if v.except('id', 'locale').all? { |_, v| v.blank? }
        v.merge!(_destroy: '1')
        params[:ninth_age_domain_magic_spell][:translations_attributes][k] = v
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
    column :domain_magic
    actions
  end

  form do |f|
    f.inputs do
      f.input :domain_magic, collection: NinthAge::DomainMagic.includes(:translations).includes(:version).order(:name).collect { |o| [o.name + ' - ' + o.version.name, o.id] }, :prompt => true
      f.input :type_target, as: :check_boxes, collection: NinthAge::DomainMagicSpell.values_for_type_target.collect { |type_target| [I18n.t("magic_spell.type_target.#{type_target}", default: type_target), type_target] }
      f.input :duration, as: :check_boxes, collection: NinthAge::DomainMagicSpell.values_for_duration.collect { |duration| [I18n.t("magic_spell.duration.#{duration}", default: duration), duration] }
      f.translate_inputs do |t|
        t.input :name
        t.input :range
        t.input :casting_value
        t.input :effect
      end
    end

    f.actions
  end

  show do |model|
    attributes_table do
      row :domain_magic
      row :type_target
      row :duration
    end
    panel 'Translations' do
      translate_attributes_table_for model do
        row :name
        row :range
        row :casting_value
        row :effect
      end
    end
  end
end