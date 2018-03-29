ActiveAdmin.register NinthAge::MagicItemCategory do
  menu parent: 'Ninth Age Magic', priority: 3

  permit_params :locale, :is_multiple, translations_attributes: [:id, :name, :locale, :_destroy]

  before_action only: [:create, :update] do
    params[:ninth_age_magic_item_category][:translations_attributes].each do |k, v|
      if v.except('id', 'locale').all? { |_, v| v.blank? }
        v.merge!(_destroy: '1')
        params[:ninth_age_magic_item_category][:translations_attributes][k] = v
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
    column :is_multiple
    actions
  end

  form do |f|
    f.inputs do
      f.translate_inputs do |t|
        t.input :name
      end
      f.input :is_multiple
    end

    f.actions
  end

  show do |model|
    panel 'Translations' do
      translate_attributes_table_for model do
        row :name
      end
    end
    attributes_table do
      row :is_multiple
    end
  end
end
