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

ActiveRecord::Schema.define(:version => 20120105194042) do

  create_table "product_receipts_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "products_receipt_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products_receipts", :force => true do |t|
    t.integer  "product_id"
    t.integer  "receipt_id"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "receipts", :force => true do |t|
    t.string   "number"
    t.integer  "reseller_id"
    t.text     "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resellers", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "number"
    t.string   "neibourhood"
    t.string   "city"
    t.string   "state"
    t.string   "phone"
    t.string   "email"
    t.string   "cnpj"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active"
    t.string   "fantasy_name"
    t.boolean  "publish"
    t.string   "internal_code", :limit => 14
  end

  create_table "roles", :force => true do |t|
    t.string   "name",              :limit => 40
    t.string   "authorizable_type", :limit => 40
    t.integer  "authorizable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_sessions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name",                              :null => false
    t.string   "email",                             :null => false
    t.string   "crypted_password",                  :null => false
    t.string   "password_salt",                     :null => false
    t.string   "persistence_token",                 :null => false
    t.string   "perishable_token",                  :null => false
    t.integer  "login_count",        :default => 0, :null => false
    t.integer  "failed_login_count", :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.date     "date_birth"
    t.string   "civil_status"
    t.string   "phone"
    t.integer  "reseller_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address"
    t.boolean  "accept"
  end

end
