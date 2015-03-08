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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150307095015) do

  create_table "classroom_notifications", force: :cascade do |t|
    t.integer  "classroom_id"
    t.integer  "importance"
    t.string   "subject"
    t.string   "content"
    t.date     "show_until"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "classroom_notifications", ["classroom_id"], name: "index_classroom_notifications_on_classroom_id"

  create_table "classrooms", force: :cascade do |t|
    t.integer  "school_id"
    t.integer  "standard"
    t.string   "division"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "classrooms", ["school_id"], name: "index_classrooms_on_school_id"

  create_table "exams", force: :cascade do |t|
    t.string   "name"
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parent_to_teacher_notifications", force: :cascade do |t|
    t.integer  "parent_id"
    t.integer  "teacher_id"
    t.integer  "importance"
    t.string   "subject"
    t.string   "content"
    t.date     "show_until"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "parent_to_teacher_notifications", ["parent_id"], name: "index_parent_to_teacher_notifications_on_parent_id"
  add_index "parent_to_teacher_notifications", ["teacher_id"], name: "index_parent_to_teacher_notifications_on_teacher_id"

  create_table "parents", force: :cascade do |t|
    t.integer  "student_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "contact_number"
    t.string   "email_address"
    t.boolean  "is_pending"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "parents", ["student_id"], name: "index_parents_on_student_id"

  create_table "school_notifications", force: :cascade do |t|
    t.integer  "school_id"
    t.integer  "importance"
    t.string   "subject"
    t.string   "content"
    t.date     "show_until"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "school_notifications", ["school_id"], name: "index_school_notifications_on_school_id"

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.string   "address"
    t.string   "contact_number"
    t.string   "email_address"
    t.boolean  "is_pending"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "student_results", force: :cascade do |t|
    t.integer  "exam_id"
    t.integer  "student_id"
    t.string   "grade"
    t.string   "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "student_results", ["exam_id"], name: "index_student_results_on_exam_id"
  add_index "student_results", ["student_id"], name: "index_student_results_on_student_id"

  create_table "students", force: :cascade do |t|
    t.integer  "classroom_id"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "doB"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "students", ["classroom_id"], name: "index_students_on_classroom_id"

  create_table "teacher_to_parent_notifications", force: :cascade do |t|
    t.integer  "teacher_id"
    t.integer  "parent_id"
    t.integer  "importance"
    t.string   "subject"
    t.string   "content"
    t.date     "show_until"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "teacher_to_parent_notifications", ["parent_id"], name: "index_teacher_to_parent_notifications_on_parent_id"
  add_index "teacher_to_parent_notifications", ["teacher_id"], name: "index_teacher_to_parent_notifications_on_teacher_id"

  create_table "teachers", force: :cascade do |t|
    t.integer  "classroom_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "contact_number"
    t.string   "email_address"
    t.boolean  "is_pending"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "teachers", ["classroom_id"], name: "index_teachers_on_classroom_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.string   "role"
    t.integer  "identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
