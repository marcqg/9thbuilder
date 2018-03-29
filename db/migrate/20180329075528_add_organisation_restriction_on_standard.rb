class AddOrganisationRestrictionOnStandard < ActiveRecord::Migration[5.0]
  def change
  	create_table "ninth_age_magic_standards_organisations", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.integer "magic_standard_id",         default: 0, null: false
      t.integer "organisation_id", default: 0, null: false
      t.index ["organisation_id", "magic_standard_id"], name: "ninth_age_magic_standards_organisations_org_standard", unique: true, using: :btree
      t.index ["magic_standard_id", "organisation_id"], name: "ninth_age_magic_standards_organisations_standard_org", unique: true, using: :btree
    end
  end
end
