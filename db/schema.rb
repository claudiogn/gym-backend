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

ActiveRecord::Schema[7.0].define(version: 2023_05_19_000435) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "namme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_exercises_on_category_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "started_at"
    t.datetime "ended_at"
    t.bigint "workout_routine_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["workout_routine_id"], name: "index_sessions_on_workout_routine_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workout_plans", force: :cascade do |t|
    t.bigint "coach_id", null: false
    t.bigint "student_id", null: false
    t.integer "number_of_sessions"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coach_id"], name: "index_workout_plans_on_coach_id"
    t.index ["student_id"], name: "index_workout_plans_on_student_id"
  end

  create_table "workout_routine_exercises", force: :cascade do |t|
    t.bigint "workout_plan_id", null: false
    t.bigint "exercise_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_workout_routine_exercises_on_exercise_id"
    t.index ["workout_plan_id"], name: "index_workout_routine_exercises_on_workout_plan_id"
  end

  create_table "workout_routines", force: :cascade do |t|
    t.string "name"
    t.bigint "workout_plan_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["workout_plan_id"], name: "index_workout_routines_on_workout_plan_id"
  end

  create_table "workout_set_details", force: :cascade do |t|
    t.integer "set_sequence_number"
    t.integer "number_of_sets"
    t.integer "min_number_of_repetitions"
    t.integer "max_number_of_repetitions"
    t.integer "rest_duration_in_seconds"
    t.text "description"
    t.bigint "workout_routine_exercise_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["workout_routine_exercise_id"], name: "index_workout_set_details_on_workout_routine_exercise_id"
  end

  create_table "workout_set_executions", force: :cascade do |t|
    t.integer "set_sequence_number"
    t.float "weight"
    t.integer "plates"
    t.bigint "workout_set_details_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["workout_set_details_id"], name: "index_workout_set_executions_on_workout_set_details_id"
  end

  add_foreign_key "exercises", "categories"
  add_foreign_key "sessions", "workout_routines"
  add_foreign_key "workout_plans", "users", column: "coach_id"
  add_foreign_key "workout_plans", "users", column: "student_id"
  add_foreign_key "workout_routine_exercises", "exercises"
  add_foreign_key "workout_routine_exercises", "workout_plans"
  add_foreign_key "workout_routines", "workout_plans"
  add_foreign_key "workout_set_details", "workout_routine_exercises"
  add_foreign_key "workout_set_executions", "workout_set_details", column: "workout_set_details_id"
end
