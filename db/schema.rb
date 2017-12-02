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

ActiveRecord::Schema.define(version: 20171127030058) do

  create_table "carriages", force: :cascade do |t|
    t.integer "number"
    t.integer "upper_seats"
    t.integer "lower_seats"
    t.integer "side_upper_seats"
    t.integer "side_lower_seats"
    t.integer "train_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sitting_seats"
    t.string "type"
    t.index ["train_id"], name: "index_carriages_on_train_id"
  end

  create_table "railway_stations", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "railway_stations_routes", force: :cascade do |t|
    t.integer "railway_station_id"
    t.integer "route_id"
    t.integer "position"
    t.time "arrival_time"
    t.time "departure_time"
  end

  create_table "routes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "start_station_id"
    t.integer "finish_station_id"
    t.integer "train_id"
    t.string "passenger_name"
    t.string "passenger_lastname"
    t.string "passenger_patronymic"
    t.string "passport_number"
    t.string "passport_series"
    t.index ["finish_station_id"], name: "index_tickets_on_finish_station_id"
    t.index ["start_station_id"], name: "index_tickets_on_start_station_id"
    t.index ["train_id"], name: "index_tickets_on_train_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "trains", force: :cascade do |t|
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "current_station_id"
    t.integer "route_id"
    t.boolean "head_sort", default: true, null: false
    t.index ["current_station_id"], name: "index_trains_on_current_station_id"
    t.index ["route_id"], name: "index_trains_on_route_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
