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

ActiveRecord::Schema.define(version: 2019_05_22_131050) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.bigint "course_id"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_attendances_on_course_id"
    t.index ["student_id"], name: "index_attendances_on_student_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.text "resource"
    t.datetime "start_time"
    t.datetime "end_time"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "teacher_id"
    t.index ["teacher_id"], name: "index_courses_on_teacher_id"
  end

  create_table "general_question_votes", force: :cascade do |t|
    t.bigint "general_question_id"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["general_question_id"], name: "index_general_question_votes_on_general_question_id"
    t.index ["student_id"], name: "index_general_question_votes_on_student_id"
  end

  create_table "general_questions", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.boolean "teacher_check", default: false
    t.bigint "student_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_general_questions_on_course_id"
    t.index ["student_id"], name: "index_general_questions_on_student_id"
  end

  create_table "group_students", force: :cascade do |t|
    t.bigint "group_id"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_students_on_group_id"
    t.index ["student_id"], name: "index_group_students_on_student_id"
  end

  create_table "group_teachers", force: :cascade do |t|
    t.bigint "group_id"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_teachers_on_group_id"
    t.index ["teacher_id"], name: "index_group_teachers_on_teacher_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pending_attendances", force: :cascade do |t|
    t.string "email"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_pending_attendances_on_course_id"
  end

  create_table "step_students", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "step_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["step_id"], name: "index_step_students_on_step_id"
    t.index ["student_id"], name: "index_step_students_on_student_id"
  end

  create_table "steps", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.boolean "teacher_check", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "course_id"
    t.index ["course_id"], name: "index_steps_on_course_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["confirmation_token"], name: "index_students_on_confirmation_token", unique: true
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_teachers_on_confirmation_token", unique: true
    t.index ["email"], name: "index_teachers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true
  end

  add_foreign_key "attendances", "courses"
  add_foreign_key "attendances", "students"
  add_foreign_key "general_question_votes", "general_questions"
  add_foreign_key "general_question_votes", "students"
  add_foreign_key "general_questions", "courses"
  add_foreign_key "general_questions", "students"
  add_foreign_key "group_students", "groups"
  add_foreign_key "group_students", "students"
  add_foreign_key "group_teachers", "groups"
  add_foreign_key "group_teachers", "teachers"
  add_foreign_key "pending_attendances", "courses"
  add_foreign_key "step_students", "steps"
  add_foreign_key "step_students", "students"
  add_foreign_key "steps", "courses"
end
