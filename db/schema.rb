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

ActiveRecord::Schema.define(:version => 20141116153237) do

  create_table "non_teaching_staffs", :force => true do |t|
    t.string   "full_name"
    t.string   "father_name"
    t.date     "date_of_birth"
    t.date     "date_of_joining"
    t.boolean  "married"
    t.string   "spouse_name"
    t.date     "aniversary_date"
    t.string   "qualification"
    t.string   "role"
    t.string   "email"
    t.string   "mobile"
    t.text     "address"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "settings", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.boolean  "default"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "logo_title"
    t.string   "signature"
  end

  create_table "sms", :force => true do |t|
    t.text     "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "students", :force => true do |t|
    t.string   "name"
    t.string   "father_name"
    t.string   "phone_number"
    t.string   "email"
    t.text     "address"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.date     "dob"
    t.string   "standard"
    t.string   "section"
  end

  create_table "teaching_staffs", :force => true do |t|
    t.string   "full_name"
    t.string   "father_name"
    t.date     "date_of_joining"
    t.date     "date_of_birth"
    t.boolean  "married"
    t.string   "spouse_name"
    t.date     "aniversary_date"
    t.string   "qualification"
    t.string   "role"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "email"
    t.string   "mobile"
    t.text     "address"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "username"
    t.string   "fullname"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
