require 'rake'

namespace :ninethbuilder do
  desc 'Fix wrong associations during unit duplication'
  task fix_associations: :environment do
    @troops = []
    @equipments = []
    @special_rules = []
    @unit_options = []

    Unit.all.each do |unit|
      unit.troops.includes(:unit_option).where.not(unit_option_id: nil).each do |troop|
        next unless troop.unit_option.unit.id != unit.id
        unit_option = unit.unit_options.detect { |uo| troop.unit_option.name == uo.name }

        next if unit_option.nil?
        troop.unit_option = unit_option
        troop.save

        @troops.push troop
      end

      unit.equipments.includes(:troop).where.not(troop_id: nil).each do |equipment|
        next unless equipment.troop.unit.id != unit.id
        troop = unit.troops.detect { |t| equipment.troop.name == t.name }

        next if troop.nil?
        equipment.troop = troop
        equipment.save

        @equipments.push equipment
      end

      unit.special_rules.includes(:troop).where.not(troop_id: nil).each do |special_rule|
        next unless special_rule.troop.unit.id != unit.id
        troop = unit.troops.detect { |t| special_rule.troop.name == t.name }

        next if troop.nil?
        special_rule.troop = troop
        special_rule.save

        @special_rules.push special_rule
      end

      unit.unit_options.includes(:parent).where.not(parent_id: nil).each do |unit_option|
        next unless unit_option.parent.unit.id != unit.id
        parent = unit.unit_options.detect { |uo| unit_option.parent.name == uo.name }

        next if parent.nil?
        unit_option.parent = parent
        unit_option.save

        @unit_options.push unit_option
      end
    end

    puts "Fix troops.unit_option_id foreign key: #{@troops.size}"
    puts "Fix equipments.troop_id foreign key: #{@equipments.size}"
    puts "Fix special_rules.troop_id foreign key: #{@special_rules.size}"
    puts "Fix units.unit_option_id foreign key: #{@unit_options.size}"
  end
end
