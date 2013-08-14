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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130814192039) do

  create_table "addresses", :force => true do |t|
    t.string   "line1"
    t.string   "line2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "addresses", ["addressable_type", "addressable_id"], :name => "index_addresses_on_addressable_type_and_addressable_id"

  create_table "conditions", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "pet_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "immunizations", :force => true do |t|
    t.string   "type"
    t.date     "date"
    t.date     "next_due"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "pet_id"
  end

  create_table "medications", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "dosage"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "pet_id"
  end

  create_table "pets", :force => true do |t|
    t.string   "name"
    t.string   "gender"
    t.string   "breed"
    t.string   "color"
    t.string   "weight"
    t.string   "license"
    t.string   "microchip"
    t.string   "species"
    t.string   "rabies_id"
    t.string   "neutered"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "vets", :force => true do |t|
    t.string   "name"
    t.string   "phone1"
    t.string   "phone2"
    t.integer  "pet_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "visits", :force => true do |t|
    t.date     "date"
    t.string   "description"
    t.string   "veterinarian"
    t.string   "diagnosis"
    t.string   "notes"
    t.integer  "pet_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
