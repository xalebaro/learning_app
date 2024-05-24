# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_05_24_221735) do
  create_table "course_module_completions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "course_module_id", null: false
    t.boolean "completed", default: false, null: false
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_module_id"], name: "index_course_module_completions_on_course_module_id"
    t.index ["user_id"], name: "index_course_module_completions_on_user_id"
  end

  create_table "course_modules", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lesson_completions", force: :cascade do |t|
    t.integer "course_module_completion_id", null: false
    t.integer "lesson_id", null: false
    t.boolean "completed", default: false, null: false
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_module_completion_id"], name: "index_lesson_completions_on_course_module_completion_id"
    t.index ["lesson_id"], name: "index_lesson_completions_on_lesson_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.text "content"
    t.integer "course_module_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "prerequisite_id"
    t.index ["course_module_id"], name: "index_lessons_on_course_module_id"
    t.index ["prerequisite_id"], name: "index_lessons_on_prerequisite_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "course_module_completions", "course_modules"
  add_foreign_key "course_module_completions", "users"
  add_foreign_key "lesson_completions", "course_module_completions"
  add_foreign_key "lesson_completions", "lessons"
  add_foreign_key "lessons", "course_modules"
  add_foreign_key "lessons", "lessons", column: "prerequisite_id"
end
