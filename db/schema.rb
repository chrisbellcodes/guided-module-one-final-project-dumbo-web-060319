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

ActiveRecord::Schema.define(version: 7) do

  create_table "crews", force: :cascade do |t|
    t.string  "name"
    t.integer "user_id"
  end

  create_table "journeys", force: :cascade do |t|
    t.string  "scenario"
    t.integer "week_number"
    t.integer "user_id"
  end

  create_table "outcomes", force: :cascade do |t|
    t.string  "choice_prompt"
    t.string  "consequence"
    t.integer "crew_modifier"
    t.integer "choice"
    t.integer "journey_id"
    t.integer "week_number"
  end

  create_table "users", force: :cascade do |t|
    t.string  "name"
    t.integer "num_of_crew", default: 7
  end

end
