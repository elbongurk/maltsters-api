# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150305011705) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "analyses", force: :cascade do |t|
    t.integer  "lot_id"
    t.integer  "malt_id"
    t.string   "name"
    t.decimal  "moisture",               precision: 4, scale: 2
    t.decimal  "fine_grind_as_is",       precision: 4, scale: 2
    t.decimal  "fine_grind_dry_basis",   precision: 4, scale: 2
    t.decimal  "coarse_grind_as_is",     precision: 4, scale: 2
    t.decimal  "coarse_grind_dry_basis", precision: 4, scale: 2
    t.decimal  "fine_coarse_grind_diff", precision: 4, scale: 2
    t.decimal  "lovibond",               precision: 5, scale: 2
    t.decimal  "diastatic_power",        precision: 5, scale: 2
    t.decimal  "alpha_amylase",          precision: 5, scale: 2
    t.decimal  "total_protein",          precision: 5, scale: 2
    t.decimal  "soluble_nitrogen",       precision: 5, scale: 2
    t.decimal  "viscosity",              precision: 5, scale: 2
    t.decimal  "beta_glucan",            precision: 5, scale: 2
    t.decimal  "assortment_1",           precision: 5, scale: 2
    t.decimal  "assortment_2",           precision: 5, scale: 2
    t.decimal  "assortment_thru",        precision: 5, scale: 2
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  create_table "lots", force: :cascade do |t|
    t.string   "code",                                           null: false
    t.string   "sku",                                            null: false
    t.integer  "malt_id",                                        null: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  create_table "maltsters", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
  end

  create_table "malts", force: :cascade do |t|
    t.string  "name",        null: false
    t.string  "code",        null: false
    t.string "type",         null: false
    t.integer "maltster_id", null: false
  end

end
