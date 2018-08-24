class ConvertOptionToCategoryOption < ActiveRecord::Migration[5.0]
  def change

    NinthAge::UnitOption.where(:is_magic => true).update_all(:category => :MagicPath)
    remove_column :ninth_age_unit_options, :is_magic
    
    NinthAge::UnitOption.where(:is_magic_standards => true).where(:banner_limit => 2).update_all(:category => :BSB)
    NinthAge::UnitOption.where(:is_magic_standards => true).where('banner_limit < ?', 2).update_all(:category => :MagicBanner)
    remove_column :ninth_age_unit_options, :is_magic_standards

    NinthAge::UnitOption.where(:is_extra_items => true).update_all(:category => :ArmyAttribut)
    remove_column :ninth_age_unit_options, :is_extra_items

    NinthAge::UnitOption.where(:is_magic_items => true).update_all(:category => :MagicEquipment)
    remove_column :ninth_age_unit_options, :is_magic_items
    

    remove_column :ninth_age_unit_options, :value_points_upgrade
    remove_column :ninth_age_unit_options, :upgrade_target
    remove_column :ninth_age_unit_options, :is_upgratable


    remove_column :ninth_age_unit_option_translations, :name_upgrade


    ActiveRecord::Base.connection.execute("UPDATE ninth_age_unit_option_translations uot
                                            INNER join ninth_age_unit_options uo on uo.id = uot.ninth_age_unit_option_id
                                          SET uot.name = null
                                          WHERE uo.category in (1, 2, 5, 9, 10, 11, 12, 13);")

    ActiveRecord::Base.connection.execute("DELETE FROM ninth_age_unit_option_translations
                                          WHERE name IS NULL AND description IS NULL and infos IS NULL;")

    ActiveRecord::Base.connection.execute("UPDATE ninth_age_unit_options
                                            SET parent_id = null
                                            WHERE category in (10, 11, 12);")

    NinthAge::UnitOption.joins(:translations)
                        .where(:name => 'May upgrade one model to each of the following')
                        .each do |option|
      if option.children.size > 0
        next 
      end
      
      option.delete
    end
                                          
                                         
                                          
  end
end
