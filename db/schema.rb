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

ActiveRecord::Schema.define(version: 2019_11_08_185228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "application_additional_files", force: :cascade do |t|
    t.integer "application_id"
    t.string "file_type"
    t.string "file_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "applications", force: :cascade do |t|
    t.integer "country_id"
    t.string "desire_program"
    t.string "passport_file"
    t.string "motivation_letter"
    t.string "recommendation_letter"
    t.string "cv"
    t.string "police_clearance_certificate"
    t.string "birth_certificate"
    t.string "bank_statement"
    t.string "bank_solvency_certificate"
    t.integer "student_id"
    t.integer "mentor_id"
    t.string "university_name"
    t.string "application_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.integer "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer "paymentable_id"
    t.string "paymentable_type"
    t.float "amount"
    t.string "status"
    t.integer "transaction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "mentor_id"
    t.string "created_by"
    t.integer "user_id"
    t.string "status"
    t.integer "student_id"
    t.boolean "is_paid"
    t.float "schedule_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_applications", force: :cascade do |t|
    t.integer "country_id"
    t.string "desire_program"
    t.string "passport_file"
    t.string "motivation_letter"
    t.string "recommendation_letter"
    t.string "cv"
    t.string "police_clearance_certificate"
    t.string "birth_certificate"
    t.string "bank_statement"
    t.string "bank_solvency_certificate"
    t.integer "student_id"
    t.integer "mentor_id"
    t.string "university_name"
    t.string "application_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.integer "city_id"
    t.string "country_name"
    t.string "city_name"
    t.string "department_name"
    t.string "university"
    t.float "cgpa"
    t.string "nationality"
    t.string "occupation"
    t.string "user_type"
    t.string "role"
    t.string "image"
    t.date "dob"
    t.string "nid"
    t.text "address"
    t.string "passport"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
