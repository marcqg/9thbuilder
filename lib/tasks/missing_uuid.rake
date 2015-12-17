require 'rake'
require 'uuidtools'

namespace :ninethbuilder do
  desc 'Fix missing UUID for army lists'
  task missing_uuid: :environment do
    ArmyList.where(uuid: '').each do |army_list|
      army_list.update_attribute(:uuid, UUIDTools::UUID.random_create.to_s)
    end
  end
end
