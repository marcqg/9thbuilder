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

ActiveRecord::Schema.define(version: 20170406143816) do

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

  create_table "armies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "version_id",        default: 0
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.index ["version_id"], name: "index_armies_on_version_id", using: :btree
  end

  create_table "army_list_unit_troops", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "army_list_unit_id", null: false
    t.integer "troop_id",          null: false
    t.integer "size"
    t.integer "position"
    t.index ["army_list_unit_id"], name: "index_army_list_unit_troops_on_army_list_unit_id", using: :btree
    t.index ["troop_id"], name: "index_army_list_unit_troops_on_troop_id", using: :btree
  end

  create_table "army_list_units", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "army_list_id"
    t.integer  "unit_id"
    t.integer  "unit_category_id"
    t.string   "name"
    t.decimal  "value_points",                   precision: 8, scale: 2
    t.integer  "size"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "notes",            limit: 65535
    t.string   "magic"
    t.index ["army_list_id"], name: "index_army_list_units_on_army_list_id", using: :btree
    t.index ["unit_category_id"], name: "index_army_list_units_on_unit_category_id", using: :btree
    t.index ["unit_id"], name: "index_army_list_units_on_unit_id", using: :btree
  end

  create_table "army_list_units_extra_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "army_list_unit_id", null: false
    t.integer "extra_item_id",     null: false
    t.index ["army_list_unit_id"], name: "index_army_list_units_extra_items_on_army_list_unit_id", using: :btree
    t.index ["extra_item_id"], name: "index_army_list_units_extra_items_on_extra_item_id", using: :btree
  end

  create_table "army_list_units_magic_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "army_list_unit_id",             null: false
    t.integer "magic_item_id",                 null: false
    t.integer "quantity",          default: 1, null: false
    t.index ["army_list_unit_id"], name: "index_army_list_units_magic_items_on_army_list_unit_id", using: :btree
    t.index ["magic_item_id"], name: "index_army_list_units_magic_items_on_magic_item_id", using: :btree
  end

  create_table "army_list_units_magic_standards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "army_list_unit_id", null: false
    t.integer "magic_standard_id", null: false
    t.index ["army_list_unit_id"], name: "index_army_list_units_magic_standards_on_army_list_unit_id", using: :btree
    t.index ["magic_standard_id"], name: "index_army_list_units_magic_standards_on_magic_standard_id", using: :btree
  end

  create_table "army_list_units_unit_options", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "army_list_unit_id",             null: false
    t.integer "unit_option_id",                null: false
    t.integer "quantity",          default: 1, null: false
    t.index ["army_list_unit_id"], name: "index_army_list_units_unit_options_on_army_list_unit_id", using: :btree
    t.index ["unit_option_id"], name: "index_army_list_units_unit_options_on_unit_option_id", using: :btree
  end

  create_table "army_lists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "army_id",                                            null: false
    t.integer  "user_id",                                            null: false
    t.string   "name",                                               null: false
    t.decimal  "value_points",               precision: 8, scale: 2, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "notes",        limit: 65535
    t.string   "uuid",         limit: 36,                            null: false
    t.index ["army_id"], name: "index_army_lists_on_army_id", using: :btree
    t.index ["user_id"], name: "index_army_lists_on_user_id", using: :btree
  end

  create_table "army_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "army_id",    null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.index ["army_id"], name: "index_army_translations_on_army_id", using: :btree
    t.index ["locale"], name: "index_army_translations_on_locale", using: :btree
  end

  create_table "equipment_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "equipment_id", null: false
    t.string   "locale",       null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "name"
    t.index ["equipment_id"], name: "index_equipment_translations_on_equipment_id", using: :btree
    t.index ["locale"], name: "index_equipment_translations_on_locale", using: :btree
  end

  create_table "equipments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "unit_id",  null: false
    t.integer "position", null: false
    t.integer "troop_id"
    t.index ["troop_id"], name: "index_equipments_on_troop_id", using: :btree
    t.index ["unit_id"], name: "index_equipments_on_unit_id", using: :btree
  end

  create_table "extra_item_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "army_id", null: false
    t.index ["army_id"], name: "index_extra_item_categories_on_army_id", using: :btree
  end

  create_table "extra_item_category_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "extra_item_category_id", null: false
    t.string   "locale",                 null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "name"
    t.index ["extra_item_category_id"], name: "index_fe18d90e32ab2fbb564dd3d49e312483fffe727a", using: :btree
    t.index ["locale"], name: "index_extra_item_category_translations_on_locale", using: :btree
  end

  create_table "extra_item_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "extra_item_id", null: false
    t.string   "locale",        null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "name"
    t.index ["extra_item_id"], name: "index_extra_item_translations_on_extra_item_id", using: :btree
    t.index ["locale"], name: "index_extra_item_translations_on_locale", using: :btree
  end

  create_table "extra_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "extra_item_category_id",                         null: false
    t.decimal "value_points",           precision: 8, scale: 2, null: false
    t.index ["extra_item_category_id"], name: "index_extra_items_on_extra_item_category_id", using: :btree
  end

  create_table "magic_item_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
  end

  create_table "magic_item_category_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "magic_item_category_id", null: false
    t.string   "locale",                 null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "name"
    t.index ["locale"], name: "index_magic_item_category_translations_on_locale", using: :btree
    t.index ["magic_item_category_id"], name: "index_95ba1a02dda97edf72f3c4182315767fd2f0c3e5", using: :btree
  end

  create_table "magic_item_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "magic_item_id", null: false
    t.string   "locale",        null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "name"
    t.index ["locale"], name: "index_magic_item_translations_on_locale", using: :btree
    t.index ["magic_item_id"], name: "index_magic_item_translations_on_magic_item_id", using: :btree
  end

  create_table "magic_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "magic_item_category_id",                                         null: false
    t.integer "army_id"
    t.decimal "value_points",           precision: 8, scale: 2,                 null: false
    t.integer "override_id"
    t.boolean "is_multiple",                                    default: false, null: false
    t.index ["army_id"], name: "index_magic_items_on_army_id", using: :btree
    t.index ["magic_item_category_id"], name: "index_magic_items_on_magic_item_category_id", using: :btree
    t.index ["override_id"], name: "index_magic_items_on_override_id", using: :btree
  end

  create_table "magic_standard_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "magic_standard_id", null: false
    t.string   "locale",            null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "name"
    t.index ["locale"], name: "index_magic_standard_translations_on_locale", using: :btree
    t.index ["magic_standard_id"], name: "index_magic_standard_translations_on_magic_standard_id", using: :btree
  end

  create_table "magic_standards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "army_id"
    t.integer "value_points", null: false
    t.integer "override_id"
    t.index ["army_id"], name: "index_magic_standards_on_army_id", using: :btree
    t.index ["override_id"], name: "index_magic_standards_on_override_id", using: :btree
  end

  create_table "ninth_age_magic_spell_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "ninth_age_magic_spell_id",               null: false
    t.string   "locale",                                 null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "name"
    t.string   "range"
    t.string   "casting_value"
    t.text     "effect",                   limit: 65535
    t.index ["locale"], name: "index_ninth_age_magic_spell_translations_on_locale", using: :btree
    t.index ["ninth_age_magic_spell_id"], name: "index_4144dde43f58acef490f4c0a79f9a2a25ea573c8", using: :btree
  end

  create_table "ninth_age_magic_spells", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "ninth_age_magic_id", default: 0, null: false
    t.integer  "type_lvl",           default: 0
    t.integer  "type_target",        default: 0
    t.integer  "duration",           default: 0
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["ninth_age_magic_id"], name: "index_ninth_age_magic_spells_on_ninth_age_magic_id", using: :btree
  end

  create_table "ninth_age_magic_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "ninth_age_magic_id",               null: false
    t.string   "locale",                           null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "name"
    t.text     "description",        limit: 65535
    t.index ["locale"], name: "index_ninth_age_magic_translations_on_locale", using: :btree
    t.index ["ninth_age_magic_id"], name: "index_ninth_age_magic_translations_on_ninth_age_magic_id", using: :btree
  end

  create_table "ninth_age_magics", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "ninth_age_version_id", default: 0, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["ninth_age_version_id"], name: "index_ninth_age_magics_on_ninth_age_version_id", using: :btree
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

  create_table "special_rule_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "special_rule_id", null: false
    t.string   "locale",          null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "name"
    t.index ["locale"], name: "index_special_rule_translations_on_locale", using: :btree
    t.index ["special_rule_id"], name: "index_special_rule_translations_on_special_rule_id", using: :btree
  end

  create_table "special_rules", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "unit_id",  null: false
    t.integer "position", null: false
    t.integer "troop_id"
    t.index ["troop_id"], name: "index_special_rules_on_troop_id", using: :btree
    t.index ["unit_id"], name: "index_special_rules_on_unit_id", using: :btree
  end

  create_table "troop_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "troop_id",   null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.index ["locale"], name: "index_troop_translations_on_locale", using: :btree
    t.index ["troop_id"], name: "index_troop_translations_on_troop_id", using: :btree
  end

  create_table "troop_type_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "troop_type_id", null: false
    t.string   "locale",        null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "name"
    t.index ["locale"], name: "index_troop_type_translations_on_locale", using: :btree
    t.index ["troop_type_id"], name: "index_troop_type_translations_on_troop_type_id", using: :btree
  end

  create_table "troop_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
  end

  create_table "troops", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "unit_id",                                          null: false
    t.integer "troop_type_id"
    t.decimal "value_points",             precision: 8, scale: 2
    t.integer "position",                                         null: false
    t.string  "M",              limit: 5
    t.string  "WS",             limit: 5
    t.string  "BS",             limit: 5
    t.string  "S",              limit: 5
    t.string  "T",              limit: 5
    t.string  "W",              limit: 5
    t.string  "I",              limit: 5
    t.string  "A",              limit: 5
    t.string  "LD",             limit: 5
    t.integer "min_size"
    t.integer "unit_option_id"
    t.index ["troop_type_id"], name: "index_troops_on_troop_type_id", using: :btree
    t.index ["unit_id"], name: "index_troops_on_unit_id", using: :btree
    t.index ["unit_option_id"], name: "index_troops_on_unit_option_id", using: :btree
  end

  create_table "unit_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "min_quota"
    t.integer "max_quota"
  end

  create_table "unit_category_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "unit_category_id", null: false
    t.string   "locale",           null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "name"
    t.index ["locale"], name: "index_unit_category_translations_on_locale", using: :btree
    t.index ["unit_category_id"], name: "index_unit_category_translations_on_unit_category_id", using: :btree
  end

  create_table "unit_option_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "unit_option_id", null: false
    t.string   "locale",         null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "name"
    t.index ["locale"], name: "index_unit_option_translations_on_locale", using: :btree
    t.index ["unit_option_id"], name: "index_unit_option_translations_on_unit_option_id", using: :btree
  end

  create_table "unit_options", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "unit_id",                                                    null: false
    t.integer "parent_id"
    t.decimal "value_points",       precision: 8, scale: 2
    t.integer "position",                                                   null: false
    t.boolean "is_per_model",                                               null: false
    t.boolean "is_magic_items",                                             null: false
    t.boolean "is_magic_standards",                                         null: false
    t.boolean "is_unique_choice",                                           null: false
    t.boolean "is_extra_items",                                             null: false
    t.integer "mount_id"
    t.boolean "is_multiple",                                default: false, null: false
    t.index ["mount_id"], name: "index_unit_options_on_mount_id", using: :btree
    t.index ["parent_id"], name: "index_unit_options_on_parent_id", using: :btree
    t.index ["unit_id"], name: "index_unit_options_on_unit_id", using: :btree
  end

  create_table "unit_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "unit_id",    null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.index ["locale"], name: "index_unit_translations_on_locale", using: :btree
    t.index ["unit_id"], name: "index_unit_translations_on_unit_id", using: :btree
  end

  create_table "units", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "army_id",                                                                null: false
    t.integer "unit_category_id",                                                       null: false
    t.integer "min_size",                                               default: 1,     null: false
    t.integer "max_size"
    t.decimal "value_points",                   precision: 8, scale: 2
    t.string  "magic"
    t.text    "notes",            limit: 65535
    t.boolean "is_unique",                                              default: false, null: false
    t.index ["army_id"], name: "index_units_on_army_id", using: :btree
    t.index ["unit_category_id"], name: "index_units_on_unit_category_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "email",                              default: "", null: false
    t.string   "encrypted_password",     limit: 128, default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
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
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["favorite_army_id"], name: "index_users_on_favorite_army_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "users_roles", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id", using: :btree
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree
    t.index ["user_id"], name: "index_users_roles_on_user_id", using: :btree
  end

  add_foreign_key "armies", "ninth_age_versions", column: "version_id", on_delete: :cascade

  create_table "version_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "version_id", null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.index ["locale"], name: "index_version_translations_on_locale", using: :btree
    t.index ["version_id"], name: "index_version_translations_on_version_id", using: :btree
  end

  create_table "versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "major",      default: 0,     null: false
    t.integer  "minor",      default: 0,     null: false
    t.integer  "fix",        default: 0,     null: false
    t.boolean  "public",     default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_foreign_key "armies", "versions", on_delete: :cascade
  add_foreign_key "army_list_unit_troops", "army_list_units", on_delete: :cascade
  add_foreign_key "army_list_unit_troops", "troops", on_delete: :cascade
  add_foreign_key "army_list_units", "army_lists"
  add_foreign_key "army_list_units", "units"
  add_foreign_key "army_list_units_extra_items", "army_list_units", on_delete: :cascade
  add_foreign_key "army_list_units_extra_items", "extra_items", on_delete: :cascade
  add_foreign_key "army_list_units_magic_items", "army_list_units", on_delete: :cascade
  add_foreign_key "army_list_units_magic_items", "magic_items", on_delete: :cascade
  add_foreign_key "army_list_units_magic_standards", "army_list_units", on_delete: :cascade
  add_foreign_key "army_list_units_magic_standards", "magic_standards", on_delete: :cascade
  add_foreign_key "army_list_units_unit_options", "army_list_units", on_delete: :cascade
  add_foreign_key "army_list_units_unit_options", "unit_options", on_delete: :cascade
  add_foreign_key "army_lists", "armies"
  add_foreign_key "army_lists", "users"
  add_foreign_key "equipments", "troops", on_delete: :nullify
  add_foreign_key "equipments", "units"
  add_foreign_key "extra_item_categories", "armies"
  add_foreign_key "extra_items", "extra_item_categories"
  add_foreign_key "magic_items", "armies"
  add_foreign_key "magic_items", "magic_item_categories"
  add_foreign_key "magic_items", "magic_items", column: "override_id"
  add_foreign_key "magic_standards", "armies"
  add_foreign_key "magic_standards", "magic_standards", column: "override_id"
  add_foreign_key "ninth_age_magic_spells", "ninth_age_magics"
  add_foreign_key "ninth_age_magics", "ninth_age_versions"
  add_foreign_key "special_rules", "troops", on_delete: :nullify
  add_foreign_key "special_rules", "units"
  add_foreign_key "troops", "troop_types"
  add_foreign_key "troops", "unit_options", on_delete: :nullify
  add_foreign_key "troops", "units"
  add_foreign_key "unit_options", "unit_options", column: "parent_id"
  add_foreign_key "unit_options", "units"
  add_foreign_key "unit_options", "units", column: "mount_id", on_delete: :nullify
  add_foreign_key "units", "armies"
  add_foreign_key "units", "unit_categories"
  add_foreign_key "users", "armies", column: "favorite_army_id", on_delete: :nullify
end
