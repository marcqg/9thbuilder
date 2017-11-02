ActiveAdmin.register NinthAge::DomainMagicSpell do
  menu parent: 'Ninth Age Magic', priority: 2

  permit_params :name, :locale, translations_attributes: [:id, :name, :range, :casting_value, :effect, :locale, :_destroy]

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
    column :magic
    actions
  end

  form do |f|
    f.inputs do
      f.input :magic, collection: NinthAge::DomainMagic.order(:name)
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
      row :magic
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
