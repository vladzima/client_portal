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

ActiveRecord::Schema.define(:version => 20121020032248) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.text     "datastore"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "customer_files", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.integer  "customer_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.text     "datastore"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.string   "street"
    t.string   "city"
    t.integer  "state_id"
    t.string   "zipcode"
    t.string   "phone"
    t.text     "datastore"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.string   "abbr"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.text     "datastore"
    t.integer  "customer_id"
    t.boolean  "internal"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
