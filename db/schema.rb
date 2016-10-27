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

ActiveRecord::Schema.define(version: 20161026112309) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.integer  "code"
    t.string   "shortname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countriesof_commissions", force: :cascade do |t|
    t.integer  "countryid"
    t.integer  "transfer_commission_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["transfer_commission_id"], name: "index_countriesof_commissions_on_transfer_commission_id", using: :btree
  end

  create_table "credit_purposes", force: :cascade do |t|
    t.integer  "purpose_id"
    t.string   "image_path"
    t.decimal  "min_rate"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "credit_types", force: :cascade do |t|
    t.integer  "type_id"
    t.text     "description"
    t.string   "caption"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "footer"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "currency_rates", force: :cascade do |t|
    t.integer  "currencyid"
    t.integer  "officeid"
    t.datetime "ratedate"
    t.decimal  "sellrate",   precision: 10, scale: 4
    t.decimal  "buyrate",    precision: 10, scale: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "typeid"
  end

  create_table "deposit_type_details", force: :cascade do |t|
    t.integer  "type_id"
    t.text     "full_description"
    t.string   "image_url"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "deposit_types", force: :cascade do |t|
    t.integer  "type_id"
    t.text     "description"
    t.string   "caption"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "footer"
  end

  create_table "garant_details", force: :cascade do |t|
    t.string   "prop_key"
    t.string   "prop_value"
    t.integer  "garant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["garant_id"], name: "index_garant_details_on_garant_id", using: :btree
  end

  create_table "garant_images", force: :cascade do |t|
    t.string   "image_path"
    t.integer  "garant_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "full_image_path"
    t.string   "image_description"
    t.boolean  "main_image"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["garant_id"], name: "index_garant_images_on_garant_id", using: :btree
  end

  create_table "garants", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.decimal  "cost"
    t.string   "region"
    t.string   "phone"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "main_banners", force: :cascade do |t|
    t.string   "caption"
    t.string   "url"
    t.string   "imgpath"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "enabled"
    t.integer  "priority"
    t.string   "color"
    t.string   "description"
  end

  create_table "mini_special_offers", force: :cascade do |t|
    t.string   "caption"
    t.string   "description"
    t.string   "body"
    t.date     "creation_date"
    t.integer  "priority"
    t.string   "image_path"
    t.boolean  "enabled"
    t.string   "description_text_color"
    t.string   "caption_text_color"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "msgs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "message"
  end

  create_table "newsitems", force: :cascade do |t|
    t.text     "caption"
    t.text     "body"
    t.date     "creation_date"
    t.integer  "priority"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.text     "description"
  end

  create_table "offices", force: :cascade do |t|
    t.decimal  "lon"
    t.decimal  "lat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "workdays"
    t.string   "workhours"
    t.string   "lunchtime"
    t.integer  "officeid"
  end

  create_table "rates", force: :cascade do |t|
    t.integer  "sym"
    t.integer  "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.integer  "type_id"
    t.integer  "year"
    t.integer  "period_id"
    t.string   "report_path"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "special_offers", force: :cascade do |t|
    t.string   "caption"
    t.string   "description"
    t.string   "body"
    t.date     "creation_date"
    t.integer  "priority"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "image_path"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "enabled"
    t.string   "description_text_color"
    t.string   "caption_text_color"
  end

  create_table "transfer_commissions", force: :cascade do |t|
    t.integer  "typeid"
    t.integer  "currencyid"
    t.integer  "countryid"
    t.decimal  "minsum"
    t.decimal  "maxsum"
    t.decimal  "commission"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "in_percent"
  end

  create_table "transfer_type_details", force: :cascade do |t|
    t.integer  "typeid"
    t.string   "url"
    t.string   "image_url"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "zalog_details", force: :cascade do |t|
    t.string   "key"
    t.string   "value"
    t.integer  "zalog_info_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["zalog_info_id"], name: "index_zalog_details_on_zalog_info_id", using: :btree
  end

  create_table "zalog_keys", force: :cascade do |t|
    t.string   "zalog_value"
    t.string   "description"
    t.decimal  "cost"
    t.string   "region"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "zolog_infos", force: :cascade do |t|
    t.string   "description"
    t.decimal  "cost"
    t.string   "region"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "zologs", force: :cascade do |t|
    t.string   "zalog_key"
    t.string   "zalog_value"
    t.string   "description"
    t.decimal  "cost"
    t.string   "region"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
