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

ActiveRecord::Schema.define(:version => 20140322160249) do

  create_table "matches", :force => true do |t|
    t.string   "opponent"
    t.integer  "gScored"
    t.integer  "gLetIn"
    t.string   "Center"
    t.integer  "pCenter"
    t.integer  "hCenter"
    t.string   "RW"
    t.integer  "pRW"
    t.integer  "hRW"
    t.string   "LW"
    t.integer  "pLW"
    t.integer  "hLW"
    t.string   "Def1"
    t.integer  "pDef1"
    t.integer  "hDef1"
    t.string   "Def2"
    t.integer  "pDef2"
    t.integer  "hDef2"
    t.string   "Goalie"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rel"
  end

  create_table "players", :force => true do |t|
    t.string   "name"
    t.integer  "matches"
    t.integer  "goals"
    t.integer  "assists"
    t.integer  "points"
    t.integer  "hits"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "RealName"
    t.string   "City"
    t.integer  "number"
    t.integer  "weight"
    t.integer  "age"
    t.float    "height"
    t.string   "position"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
