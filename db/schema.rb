# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180108132010) do

  create_table "active_admin_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "resource_id",                 null: false
    t.string   "resource_type",               null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body",          limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_admin_notes_on_resource_type_and_resource_id", using: :btree
  end

  create_table "builder_army_list_organisations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "army_list_id",    default: 0,     null: false
    t.integer "organisation_id", default: 0,     null: false
    t.integer "pts",             default: 0,     null: false
    t.integer "rate",            default: 0,     null: false
    t.boolean "good",            default: false, null: false
    t.index ["army_list_id", "organisation_id"], name: "builder_army_list_organisations_army_list_organisation", unique: true, using: :btree
    t.index ["organisation_id", "army_list_id"], name: "builder_army_list_organisations_organisation_army_list", unique: true, using: :btree
  end

  create_table "builder_army_list_unit_extra_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "army_list_unit_id", null: false
    t.integer "extra_item_id",     null: false
    t.index ["army_list_unit_id"], name: "index_builder_army_list_unit_extra_items_on_army_list_unit_id", using: :btree
    t.index ["extra_item_id"], name: "index_builder_army_list_unit_extra_items_on_extra_item_id", using: :btree
  end

  create_table "builder_army_list_unit_magic_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "army_list_unit_id",             null: false
    t.integer "magic_item_id",                 null: false
    t.integer "quantity",          default: 1, null: false
    t.index ["army_list_unit_id"], name: "index_builder_army_list_unit_magic_items_on_army_list_unit_id", using: :btree
    t.index ["magic_item_id"], name: "index_builder_army_list_unit_magic_items_on_magic_item_id", using: :btree
  end

  create_table "builder_army_list_unit_magic_standards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "army_list_unit_id", null: false
    t.integer "magic_standard_id", null: false
    t.index ["army_list_unit_id"], name: "index_builder_armylistunit_magicstandards_on_armylistunit_id", using: :btree
    t.index ["magic_standard_id"], name: "index_builder_armylistunit_magicstandards_on_magicstandard_id", using: :btree
  end

  create_table "builder_army_list_unit_troops", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "army_list_unit_id", null: false
    t.integer "troop_id",          null: false
    t.integer "size"
    t.integer "position"
    t.index ["army_list_unit_id"], name: "index_builder_army_list_unit_troops_on_army_list_unit_id", using: :btree
    t.index ["troop_id"], name: "index_builder_army_list_unit_troops_on_troop_id", using: :btree
  end

  create_table "builder_army_list_unit_unit_options", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "army_list_unit_id",             null: false
    t.integer "unit_option_id",                null: false
    t.integer "quantity",          default: 1, null: false
    t.index ["army_list_unit_id"], name: "index_builder_army_list_unit_unit_options_on_army_list_unit_id", using: :btree
    t.index ["unit_option_id"], name: "index_builder_army_list_unit_unit_options_on_unit_option_id", using: :btree
  end

  create_table "builder_army_list_units", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "army_list_id"
    t.integer  "unit_id"
    t.string   "name"
    t.decimal  "value_points",               precision: 8, scale: 2
    t.integer  "size"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "notes",        limit: 65535
    t.string   "magic"
    t.index ["army_list_id"], name: "index_builder_army_list_units_on_army_list_id", using: :btree
    t.index ["unit_id"], name: "index_builder_army_list_units_on_unit_id", using: :btree
  end

  create_table "builder_army_lists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "army_id",                                                                null: false
    t.integer  "user_id",                                                                null: false
    t.string   "name",                                                                   null: false
    t.decimal  "value_points",                       precision: 8, scale: 2,             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "notes",                limit: 65535
    t.string   "uuid",                 limit: 36,                                        null: false
    t.integer  "army_organisation_id",                                       default: 0
    t.integer  "max",                                                        default: 0, null: false
    t.index ["army_id"], name: "index_builder_army_lists_on_army_id", using: :btree
    t.index ["army_organisation_id"], name: "index_builder_army_lists_on_army_organisation_id", using: :btree
    t.index ["user_id"], name: "index_builder_army_lists_on_user_id", using: :btree
  end

  create_table "ninth_age_armies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "version_id",              default: 0
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "logo_large_file_name"
    t.string   "logo_large_content_type"
    t.integer  "logo_large_file_size"
    t.datetime "logo_large_updated_at"
    t.boolean  "has_default_magic_items", default: true, null: false
    t.index ["version_id"], name: "index_ninth_age_armies_on_version_id", using: :btree
  end

  create_table "ninth_age_army_magic_spell_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "ninth_age_army_magic_spell_id",               null: false
    t.string   "locale",                                      null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "name"
    t.string   "range"
    t.string   "casting_value"
    t.text     "effect",                        limit: 65535
    t.text     "description",                   limit: 65535
    t.index ["locale"], name: "index_ninth_age_army_magic_spell_translations_on_locale", using: :btree
    t.index ["ninth_age_army_magic_spell_id"], name: "index_470d1e47675f2000858aa3595f707852fd2108a3", using: :btree
  end

  create_table "ninth_age_army_magic_spells", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "army_id",     default: 0, null: false
    t.integer  "type_target", default: 0, null: false
    t.integer  "duration",    default: 0, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["army_id"], name: "fk_rails_92ff906c42", using: :btree
  end

  create_table "ninth_age_army_organisation_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "ninth_age_army_organisation_id", null: false
    t.string   "locale",                         null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "name"
    t.string   "description"
    t.index ["locale"], name: "index_ninth_age_army_organisation_translations_on_locale", using: :btree
    t.index ["ninth_age_army_organisation_id"], name: "index_cfb38c609844172d9baeb51542c668320535e89a", using: :btree
  end

  create_table "ninth_age_army_organisations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "army_id",    default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["army_id"], name: "fk_rails_c50add3996", using: :btree
  end

  create_table "ninth_age_army_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "ninth_age_army_id", null: false
    t.string   "locale",            null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "name"
    t.index ["locale"], name: "index_ninth_age_army_translations_on_locale", using: :btree
    t.index ["ninth_age_army_id"], name: "index_ninth_age_army_translations_on_ninth_age_army_id", using: :btree
  end

  create_table "ninth_age_domain_magic_spell_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "ninth_age_domain_magic_spell_id",               null: false
    t.string   "locale",                                        null: false
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "name"
    t.string   "range"
    t.string   "casting_value"
    t.text     "effect",                          limit: 65535
    t.index ["locale"], name: "index_ninth_age_domain_magic_spell_translations_on_locale", using: :btree
    t.index ["ninth_age_domain_magic_spell_id"], name: "index_ninth_age_domain_magic_translations_on_magic_id", using: :btree
  end

  create_table "ninth_age_domain_magic_spells", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "domain_magic_id",             null: false
    t.integer  "type_lvl",        default: 0
    t.integer  "type_target",     default: 0
    t.integer  "duration",        default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["domain_magic_id"], name: "index_ninth_age_domain_magic_spells_on_domain_magic_id", using: :btree
  end

  create_table "ninth_age_domain_magic_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "ninth_age_domain_magic_id",               null: false
    t.string   "locale",                                  null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "name"
    t.text     "description",               limit: 65535
    t.index ["locale"], name: "index_ninth_age_domain_magic_translations_on_locale", using: :btree
    t.index ["ninth_age_domain_magic_id"], name: "index_ninth_age_domain_magic_translations_on_magic_id", using: :btree
  end

  create_table "ninth_age_domain_magics", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "version_id",        null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.index ["version_id"], name: "index_ninth_age_domain_magics_on_version_id", using: :btree
  end

  create_table "ninth_age_equipment_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "ninth_age_equipment_id",               null: false
    t.string   "locale",                               null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "name"
    t.text     "description",            limit: 65535
    t.index ["locale"], name: "index_ninth_age_equipment_translations_on_locale", using: :btree
    t.index ["ninth_age_equipment_id"], name: "index_988058a4c70faa82db616cf9fa0a90fa66d1b61f", using: :btree
  end

  create_table "ninth_age_equipment_unit_troops", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "equipment_id", default: 0, null: false
    t.integer  "unit_id",      default: 0, null: false
    t.integer  "troop_id"
    t.integer  "position",     default: 0, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["equipment_id", "unit_id", "troop_id"], name: "ninth_age_equipments_troops_rule_troop", unique: true, using: :btree
    t.index ["troop_id"], name: "fk_rails_dccb795808", using: :btree
    t.index ["unit_id"], name: "fk_rails_fc56c1191a", using: :btree
  end

  create_table "ninth_age_equipments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "version_id", default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "type_lvl",   default: 0, null: false
    t.index ["version_id"], name: "index_ninth_age_equipments_on_version_id", using: :btree
  end

  create_table "ninth_age_extra_item_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "army_id", null: false
    t.index ["army_id"], name: "index_ninth_age_extra_item_categories_on_army_id", using: :btree
  end

  create_table "ninth_age_extra_item_category_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "ninth_age_extra_item_category_id", null: false
    t.string   "locale",                           null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "name"
    t.index ["locale"], name: "index_ninth_age_extra_item_category_translations_on_locale", using: :btree
    t.index ["ninth_age_extra_item_category_id"], name: "index_dd6d9b5c45a9ea8b86c0516f4d17ba30cd6e7930", using: :btree
  end

  create_table "ninth_age_extra_item_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "ninth_age_extra_item_id",               null: false
    t.string   "locale",                                null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "name"
    t.text     "description",             limit: 65535
    t.index ["locale"], name: "index_ninth_age_extra_item_translations_on_locale", using: :btree
    t.index ["ninth_age_extra_item_id"], name: "index_a3691c2c997dc761d820ee9cc8ad386aec523816", using: :btree
  end

  create_table "ninth_age_extra_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "extra_item_category_id",                                     null: false
    t.decimal "value_points",           precision: 8, scale: 2,             null: false
    t.integer "version_id",                                     default: 0, null: false
    t.integer "max",                                            default: 0, null: false
    t.index ["extra_item_category_id"], name: "index_ninth_age_extra_items_on_extra_item_category_id", using: :btree
    t.index ["version_id"], name: "index_ninth_age_extra_items_on_version_id", using: :btree
  end

  create_table "ninth_age_magic_item_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.boolean "is_multiple", default: false, null: false
  end

  create_table "ninth_age_magic_item_category_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "ninth_age_magic_item_category_id", null: false
    t.string   "locale",                           null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "name"
    t.index ["locale"], name: "index_ninth_age_magic_item_category_translations_on_locale", using: :btree
    t.index ["ninth_age_magic_item_category_id"], name: "index_ecc3fdfb7d5c304a55d1e97d2bdc8a570adace8a", using: :btree
  end

  create_table "ninth_age_magic_item_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "ninth_age_magic_item_id",               null: false
    t.string   "locale",                                null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "name"
    t.text     "description",             limit: 65535
    t.index ["locale"], name: "index_ninth_age_magic_item_translations_on_locale", using: :btree
    t.index ["ninth_age_magic_item_id"], name: "index_df4d007c32d8556b64250547013147b2f38eb422", using: :btree
  end

  create_table "ninth_age_magic_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "magic_item_category_id",                 null: false
    t.integer "army_id"
    t.integer "value_points",                           null: false
    t.integer "override_id"
    t.boolean "is_multiple",            default: false, null: false
    t.integer "version_id",             default: 0,     null: false
    t.integer "type_figurine",          default: 0,     null: false
    t.integer "type_target"
    t.integer "type_duration"
    t.integer "max",                    default: 0,     null: false
    t.boolean "is_dominant",            default: false, null: false
    t.index ["army_id"], name: "index_ninth_age_magic_items_on_army_id", using: :btree
    t.index ["magic_item_category_id"], name: "index_ninth_age_magic_items_on_magic_item_category_id", using: :btree
    t.index ["override_id"], name: "index_ninth_age_magic_items_on_override_id", using: :btree
    t.index ["version_id"], name: "index_ninth_age_magic_items_on_version_id", using: :btree
  end

  create_table "ninth_age_magic_standard_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "ninth_age_magic_standard_id",               null: false
    t.string   "locale",                                    null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "name"
    t.text     "description",                 limit: 65535
    t.index ["locale"], name: "index_ninth_age_magic_standard_translations_on_locale", using: :btree
    t.index ["ninth_age_magic_standard_id"], name: "index_ddbd87e0b439bcbd0c784b45e90af2a8014a66e1", using: :btree
  end

  create_table "ninth_age_magic_standards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "army_id"
    t.integer "value_points",              null: false
    t.integer "override_id"
    t.integer "version_id",    default: 0, null: false
    t.integer "type_figurine", default: 0, null: false
    t.integer "max",           default: 0, null: false
    t.index ["army_id"], name: "index_ninth_age_magic_standards_on_army_id", using: :btree
    t.index ["override_id"], name: "index_ninth_age_magic_standards_on_override_id", using: :btree
    t.index ["version_id"], name: "index_ninth_age_magic_standards_on_version_id", using: :btree
  end

  create_table "ninth_age_organisation_changes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "default_organisation_id", default: 0, null: false
    t.integer  "new_organisation_id",     default: 0, null: false
    t.integer  "unit_id",                 default: 0, null: false
    t.integer  "number",                  default: 0, null: false
    t.integer  "type_target",             default: 0
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["default_organisation_id"], name: "index_ninth_age_organisation_changes_on_default_organisation_id", using: :btree
    t.index ["new_organisation_id"], name: "index_ninth_age_organisation_changes_on_new_organisation_id", using: :btree
    t.index ["unit_id"], name: "index_ninth_age_organisation_changes_on_unit_id", using: :btree
  end

  create_table "ninth_age_organisation_groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "army_organisation_id", default: 0, null: false
    t.integer  "organisation_id",      default: 0, null: false
    t.integer  "type_target",          default: 0
    t.integer  "target",               default: 0, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["army_organisation_id"], name: "index_ninth_age_organisation_groups_on_army_organisation_id", using: :btree
    t.index ["organisation_id"], name: "index_ninth_age_organisation_groups_on_organisation_id", using: :btree
  end

  create_table "ninth_age_organisation_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "ninth_age_organisation_id", null: false
    t.string   "locale",                    null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "name"
    t.index ["locale"], name: "index_ninth_age_organisation_translations_on_locale", using: :btree
    t.index ["ninth_age_organisation_id"], name: "index_85a84f7711e02266cabe29a3c8de1c0c9318cccd", using: :btree
  end

  create_table "ninth_age_organisations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "army_id",           default: 0,     null: false
    t.boolean  "isSpecialRule",     default: false, null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.index ["army_id"], name: "fk_rails_aa1632086c", using: :btree
  end

  create_table "ninth_age_organisations_units", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "unit_id",         default: 0, null: false
    t.integer "organisation_id", default: 0, null: false
    t.index ["organisation_id", "unit_id"], name: "ninth_age_units_organisations_organisation_unit", unique: true, using: :btree
    t.index ["unit_id", "organisation_id"], name: "ninth_age_units_organisations_unit_organisation", unique: true, using: :btree
  end

  create_table "ninth_age_special_rule_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "ninth_age_special_rule_id",               null: false
    t.string   "locale",                                  null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "name"
    t.text     "description",               limit: 65535
    t.index ["locale"], name: "index_ninth_age_special_rule_translations_on_locale", using: :btree
    t.index ["ninth_age_special_rule_id"], name: "index_ed7d13913dad10860cc6f0c91dca13f4c632329a", using: :btree
  end

  create_table "ninth_age_special_rule_unit_troops", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "special_rule_id", default: 0, null: false
    t.integer  "unit_id",         default: 0, null: false
    t.integer  "troop_id"
    t.integer  "position",        default: 0, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["special_rule_id", "unit_id", "troop_id"], name: "ninth_age_special_rules_troops_rule_troop", unique: true, using: :btree
    t.index ["troop_id"], name: "fk_rails_c9f69daf3b", using: :btree
    t.index ["unit_id"], name: "fk_rails_2a74b899ae", using: :btree
  end

  create_table "ninth_age_special_rules", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "version_id", default: 0, null: false
    t.integer  "army_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "type_lvl",   default: 0, null: false
    t.index ["army_id"], name: "index_ninth_age_special_rules_on_army_id", using: :btree
    t.index ["version_id"], name: "index_ninth_age_special_rules_on_version_id", using: :btree
  end

  create_table "ninth_age_troop_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "ninth_age_troop_id", null: false
    t.string   "locale",             null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "name"
    t.index ["locale"], name: "index_ninth_age_troop_translations_on_locale", using: :btree
    t.index ["ninth_age_troop_id"], name: "index_ninth_age_troop_translations_on_ninth_age_troop_id", using: :btree
  end

  create_table "ninth_age_troop_type_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "ninth_age_troop_type_id", null: false
    t.string   "locale",                  null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "name"
    t.index ["locale"], name: "index_ninth_age_troop_type_translations_on_locale", using: :btree
    t.index ["ninth_age_troop_type_id"], name: "index_f413937ae6ce9a68a330a55a940c218532df2a9b", using: :btree
  end

  create_table "ninth_age_troop_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
  end

  create_table "ninth_age_troops", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "unit_id",                                                       null: false
    t.integer "troop_type_id"
    t.decimal "value_points",              precision: 8, scale: 2
    t.integer "position",                                                      null: false
    t.string  "M",              limit: 15
    t.string  "WS",             limit: 15
    t.string  "BS",             limit: 15
    t.string  "S",              limit: 15
    t.string  "T",              limit: 15
    t.string  "W",              limit: 15
    t.string  "I",              limit: 15
    t.string  "A",              limit: 15
    t.string  "LD",             limit: 15
    t.integer "min_size"
    t.integer "unit_option_id"
    t.string  "E",              limit: 15
    t.integer "type_carac",                                        default: 0, null: false
    t.string  "carac_att"
    t.string  "carac_of"
    t.string  "carac_str"
    t.string  "carac_ap"
    t.string  "carac_agi"
    t.index ["troop_type_id"], name: "index_ninth_age_troops_on_troop_type_id", using: :btree
    t.index ["unit_id"], name: "index_ninth_age_troops_on_unit_id", using: :btree
    t.index ["unit_option_id"], name: "index_ninth_age_troops_on_unit_option_id", using: :btree
  end

  create_table "ninth_age_unit_option_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "ninth_age_unit_option_id",               null: false
    t.string   "locale",                                 null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "name"
    t.text     "description",              limit: 65535
    t.text     "name_upgrade",             limit: 65535
    t.index ["locale"], name: "index_ninth_age_unit_option_translations_on_locale", using: :btree
    t.index ["ninth_age_unit_option_id"], name: "index_3eb812a99d96523232efee7c3e6a269e0424207a", using: :btree
  end

  create_table "ninth_age_unit_options", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "unit_id",                                                      null: false
    t.integer "parent_id"
    t.decimal "value_points",         precision: 8, scale: 2
    t.integer "position",                                                     null: false
    t.boolean "is_per_model",                                 default: false, null: false
    t.boolean "is_magic_items",                               default: false, null: false
    t.boolean "is_magic_standards",                           default: false, null: false
    t.boolean "is_unique_choice",                             default: false, null: false
    t.boolean "is_extra_items",                               default: false, null: false
    t.integer "mount_id"
    t.boolean "is_multiple",                                  default: false, null: false
    t.boolean "is_required",                                  default: false, null: false
    t.boolean "is_magic",                                     default: false, null: false
    t.boolean "is_upgratable",                                default: false, null: false
    t.integer "domain_magic_id"
    t.integer "organisation_id"
    t.integer "value_points_upgrade"
    t.integer "upgrade_target",                               default: 0,     null: false
    t.integer "max"
    t.integer "max_model"
    t.integer "min_model"
    t.integer "max_unit"
    t.index ["domain_magic_id"], name: "index_ninth_age_options_on_magic_id", using: :btree
    t.index ["mount_id"], name: "index_ninth_age_unit_options_on_mount_id", using: :btree
    t.index ["parent_id"], name: "index_ninth_age_unit_options_on_parent_id", using: :btree
    t.index ["unit_id"], name: "index_ninth_age_unit_options_on_unit_id", using: :btree
  end

  create_table "ninth_age_unit_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "ninth_age_unit_id", null: false
    t.string   "locale",            null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "name"
    t.index ["locale"], name: "index_ninth_age_unit_translations_on_locale", using: :btree
    t.index ["ninth_age_unit_id"], name: "index_ninth_age_unit_translations_on_ninth_age_unit_id", using: :btree
  end

  create_table "ninth_age_unit_type_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "ninth_age_unit_type_id", null: false
    t.string   "locale",                 null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "name"
    t.index ["locale"], name: "index_ninth_age_unit_type_translations_on_locale", using: :btree
    t.index ["ninth_age_unit_type_id"], name: "index_deefb4eb525c24946ac04ddd01ed6b8f6e5f99e2", using: :btree
  end

  create_table "ninth_age_unit_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ninth_age_units", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "army_id",                                                                null: false
    t.integer "min_size",                                               default: 1,     null: false
    t.integer "max_size"
    t.decimal "value_points",                   precision: 8, scale: 2
    t.string  "magic"
    t.text    "notes",            limit: 65535
    t.boolean "is_mount",                                               default: false, null: false
    t.integer "type_figurine",                                          default: 0,     null: false
    t.integer "base",                                                   default: 0,     null: false
    t.integer "max",                                                    default: 0
    t.integer "max_model"
    t.integer "order",                                                  default: 0,     null: false
    t.integer "size",                                                   default: 0,     null: false
    t.integer "type_carac",                                             default: 0,     null: false
    t.string  "carac_ground_adv"
    t.string  "carac_ground_mar"
    t.string  "carac_fly_adv"
    t.string  "carac_fly_mar"
    t.string  "carac_dis"
    t.string  "carac_evoked"
    t.string  "carac_hp"
    t.string  "carac_def"
    t.string  "carac_res"
    t.string  "carac_as"
    t.string  "carac_spe"
    t.integer "unit_type_id"
    t.index ["army_id"], name: "index_ninth_age_units_on_army_id", using: :btree
    t.index ["unit_type_id"], name: "fk_rails_09d59f4e7e", using: :btree
  end

  create_table "ninth_age_version_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "ninth_age_version_id", null: false
    t.string   "locale",               null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "name"
    t.index ["locale"], name: "index_ninth_age_version_translations_on_locale", using: :btree
    t.index ["ninth_age_version_id"], name: "index_ninth_age_version_translations_on_ninth_age_version_id", using: :btree
  end

  create_table "ninth_age_versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "major",      default: 0,     null: false
    t.integer  "minor",      default: 0,     null: false
    t.integer  "fix",        default: 0,     null: false
    t.boolean  "public",     default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
    t.index ["name"], name: "index_roles_on_name", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "email",                                default: "",      null: false
    t.string   "encrypted_password",     limit: 128,   default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "favorite_army_id"
    t.string   "provider",                             default: "email", null: false
    t.string   "uid",                                  default: "",      null: false
    t.text     "tokens",                 limit: 65535
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["favorite_army_id"], name: "index_users_on_favorite_army_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

  create_table "users_roles", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id", null: false
    t.integer "role_id", null: false
    t.index ["role_id"], name: "index_users_roles_on_role_id", using: :btree
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree
    t.index ["user_id"], name: "index_users_roles_on_user_id", using: :btree
  end

  add_foreign_key "builder_army_list_organisations", "builder_army_lists", column: "army_list_id"
  add_foreign_key "builder_army_list_organisations", "ninth_age_organisations", column: "organisation_id"
  add_foreign_key "builder_army_list_unit_extra_items", "builder_army_list_units", column: "army_list_unit_id", on_delete: :cascade
  add_foreign_key "builder_army_list_unit_extra_items", "ninth_age_extra_items", column: "extra_item_id", on_delete: :cascade
  add_foreign_key "builder_army_list_unit_magic_items", "builder_army_list_units", column: "army_list_unit_id", on_delete: :cascade
  add_foreign_key "builder_army_list_unit_magic_items", "ninth_age_magic_items", column: "magic_item_id", on_delete: :cascade
  add_foreign_key "builder_army_list_unit_magic_standards", "builder_army_list_units", column: "army_list_unit_id", on_delete: :cascade
  add_foreign_key "builder_army_list_unit_magic_standards", "ninth_age_magic_standards", column: "magic_standard_id", on_delete: :cascade
  add_foreign_key "builder_army_list_unit_troops", "builder_army_list_units", column: "army_list_unit_id", on_delete: :cascade
  add_foreign_key "builder_army_list_unit_troops", "ninth_age_troops", column: "troop_id", on_delete: :cascade
  add_foreign_key "builder_army_list_unit_unit_options", "builder_army_list_units", column: "army_list_unit_id", on_delete: :cascade
  add_foreign_key "builder_army_list_unit_unit_options", "ninth_age_unit_options", column: "unit_option_id", on_delete: :cascade
  add_foreign_key "builder_army_list_units", "builder_army_lists", column: "army_list_id"
  add_foreign_key "builder_army_list_units", "ninth_age_units", column: "unit_id"
  add_foreign_key "builder_army_lists", "ninth_age_armies", column: "army_id"
  add_foreign_key "builder_army_lists", "ninth_age_army_organisations", column: "army_organisation_id", on_delete: :cascade
  add_foreign_key "builder_army_lists", "users"
  add_foreign_key "ninth_age_armies", "ninth_age_versions", column: "version_id", on_delete: :cascade
  add_foreign_key "ninth_age_army_magic_spell_translations", "ninth_age_army_magic_spells", on_delete: :cascade
  add_foreign_key "ninth_age_army_magic_spells", "ninth_age_armies", column: "army_id"
  add_foreign_key "ninth_age_army_organisation_translations", "ninth_age_army_organisations", on_delete: :cascade
  add_foreign_key "ninth_age_army_organisations", "ninth_age_armies", column: "army_id"
  add_foreign_key "ninth_age_army_translations", "ninth_age_armies", on_delete: :cascade
  add_foreign_key "ninth_age_domain_magic_spell_translations", "ninth_age_domain_magic_spells", on_delete: :cascade
  add_foreign_key "ninth_age_domain_magic_spells", "ninth_age_domain_magics", column: "domain_magic_id"
  add_foreign_key "ninth_age_domain_magic_translations", "ninth_age_domain_magics", on_delete: :cascade
  add_foreign_key "ninth_age_domain_magics", "ninth_age_versions", column: "version_id"
  add_foreign_key "ninth_age_equipment_translations", "ninth_age_equipments", on_delete: :cascade
  add_foreign_key "ninth_age_equipment_unit_troops", "ninth_age_equipments", column: "equipment_id"
  add_foreign_key "ninth_age_equipment_unit_troops", "ninth_age_troops", column: "troop_id"
  add_foreign_key "ninth_age_equipment_unit_troops", "ninth_age_units", column: "unit_id"
  add_foreign_key "ninth_age_extra_item_categories", "ninth_age_armies", column: "army_id"
  add_foreign_key "ninth_age_extra_item_category_translations", "ninth_age_extra_item_categories", on_delete: :cascade
  add_foreign_key "ninth_age_extra_item_translations", "ninth_age_extra_items", on_delete: :cascade
  add_foreign_key "ninth_age_extra_items", "ninth_age_extra_item_categories", column: "extra_item_category_id"
  add_foreign_key "ninth_age_magic_item_category_translations", "ninth_age_magic_item_categories", on_delete: :cascade
  add_foreign_key "ninth_age_magic_item_translations", "ninth_age_magic_items", on_delete: :cascade
  add_foreign_key "ninth_age_magic_items", "ninth_age_armies", column: "army_id"
  add_foreign_key "ninth_age_magic_items", "ninth_age_magic_item_categories", column: "magic_item_category_id"
  add_foreign_key "ninth_age_magic_items", "ninth_age_magic_items", column: "override_id"
  add_foreign_key "ninth_age_magic_standard_translations", "ninth_age_magic_standards", on_delete: :cascade
  add_foreign_key "ninth_age_magic_standards", "ninth_age_armies", column: "army_id"
  add_foreign_key "ninth_age_magic_standards", "ninth_age_magic_standards", column: "override_id"
  add_foreign_key "ninth_age_organisation_changes", "ninth_age_organisations", column: "default_organisation_id"
  add_foreign_key "ninth_age_organisation_changes", "ninth_age_organisations", column: "new_organisation_id"
  add_foreign_key "ninth_age_organisation_changes", "ninth_age_units", column: "unit_id"
  add_foreign_key "ninth_age_organisation_groups", "ninth_age_army_organisations", column: "army_organisation_id"
  add_foreign_key "ninth_age_organisation_groups", "ninth_age_organisations", column: "organisation_id"
  add_foreign_key "ninth_age_organisation_translations", "ninth_age_organisations", on_delete: :cascade
  add_foreign_key "ninth_age_organisations", "ninth_age_armies", column: "army_id"
  add_foreign_key "ninth_age_organisations_units", "ninth_age_organisations", column: "organisation_id"
  add_foreign_key "ninth_age_organisations_units", "ninth_age_units", column: "unit_id"
  add_foreign_key "ninth_age_special_rule_translations", "ninth_age_special_rules", on_delete: :cascade
  add_foreign_key "ninth_age_special_rule_unit_troops", "ninth_age_special_rules", column: "special_rule_id"
  add_foreign_key "ninth_age_special_rule_unit_troops", "ninth_age_troops", column: "troop_id"
  add_foreign_key "ninth_age_special_rule_unit_troops", "ninth_age_units", column: "unit_id"
  add_foreign_key "ninth_age_troop_translations", "ninth_age_troops", on_delete: :cascade
  add_foreign_key "ninth_age_troop_type_translations", "ninth_age_troop_types", on_delete: :cascade
  add_foreign_key "ninth_age_troops", "ninth_age_troop_types", column: "troop_type_id"
  add_foreign_key "ninth_age_troops", "ninth_age_unit_options", column: "unit_option_id", on_delete: :nullify
  add_foreign_key "ninth_age_troops", "ninth_age_units", column: "unit_id"
  add_foreign_key "ninth_age_unit_option_translations", "ninth_age_unit_options", on_delete: :cascade
  add_foreign_key "ninth_age_unit_options", "ninth_age_domain_magics", column: "domain_magic_id", on_delete: :cascade
  add_foreign_key "ninth_age_unit_options", "ninth_age_unit_options", column: "parent_id"
  add_foreign_key "ninth_age_unit_options", "ninth_age_units", column: "mount_id", on_delete: :nullify
  add_foreign_key "ninth_age_unit_options", "ninth_age_units", column: "unit_id"
  add_foreign_key "ninth_age_unit_translations", "ninth_age_units", on_delete: :cascade
  add_foreign_key "ninth_age_unit_type_translations", "ninth_age_unit_types", on_delete: :cascade
  add_foreign_key "ninth_age_units", "ninth_age_armies", column: "army_id"
  add_foreign_key "ninth_age_units", "ninth_age_unit_types", column: "unit_type_id", on_delete: :cascade
  add_foreign_key "users", "ninth_age_armies", column: "favorite_army_id", on_delete: :nullify
  add_foreign_key "users_roles", "roles"
  add_foreign_key "users_roles", "users"
end
