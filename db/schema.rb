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

ActiveRecord::Schema.define(:version => 20111023151942) do

  create_table "archives", :force => true do |t|
    t.integer  "player_id"
    t.integer  "played"
    t.integer  "won"
    t.integer  "loss"
    t.integer  "drawn"
    t.integer  "mom"
    t.integer  "noshow"
    t.integer  "points"
    t.integer  "rank"
    t.string   "season"
    t.integer  "champion"
    t.integer  "season_id"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "archives", ["player_id"], :name => "index_archives_on_player_id"

  create_table "comments", :force => true do |t|
    t.text     "body"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["post_id"], :name => "index_comments_on_post_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "participants", :force => true do |t|
    t.boolean  "mom"
    t.integer  "post_id"
    t.integer  "user_id"
    t.integer  "score_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "participants", ["post_id"], :name => "index_participants_on_post_id"
  add_index "participants", ["score_id"], :name => "index_participants_on_score_id"
  add_index "participants", ["user_id"], :name => "index_participants_on_user_id"

  create_table "players", :force => true do |t|
    t.string   "mnfname"
    t.string   "fname"
    t.string   "lname"
    t.string   "img"
    t.boolean  "active"
    t.text     "profile"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "devise_id"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.binary   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "game_date"
    t.integer  "season_id"
    t.boolean  "publish"
  end

  create_table "scores", :force => true do |t|
    t.text     "result"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seasons", :force => true do |t|
    t.string   "name"
    t.boolean  "active"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "surname"
    t.string   "img"
    t.boolean  "active"
    t.string   "mnfname"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end