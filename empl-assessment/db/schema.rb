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

ActiveRecord::Schema.define(version: 20161007145041) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appraisals", force: :cascade do |t|
    t.integer  "employee_id"
    t.date     "planned_on"
    t.date     "completed_at"
    t.text     "comments"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "status"
    t.date     "started_at"
    t.index ["employee_id"], name: "index_appraisals_on_employee_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "competencies", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_competencies_on_category_id", using: :btree
  end

  create_table "competency_evaluations", force: :cascade do |t|
    t.integer  "appraisal_id"
    t.integer  "competency_id"
    t.integer  "mark"
    t.text     "comments"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["appraisal_id"], name: "index_competency_evaluations_on_appraisal_id", using: :btree
    t.index ["competency_id"], name: "index_competency_evaluations_on_competency_id", using: :btree
  end

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.integer  "manager_id"
    t.integer  "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_employees_on_job_id", using: :btree
    t.index ["manager_id"], name: "index_employees_on_manager_id", using: :btree
  end

  create_table "job_competencies", force: :cascade do |t|
    t.integer  "job_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_job_competencies_on_category_id", using: :btree
    t.index ["job_id"], name: "index_job_competencies_on_job_id", using: :btree
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "appraisals", "employees"
  add_foreign_key "competency_evaluations", "appraisals"
  add_foreign_key "competency_evaluations", "competencies", on_delete: :cascade
  add_foreign_key "employees", "employees", column: "manager_id"
  add_foreign_key "employees", "jobs"
  add_foreign_key "job_competencies", "categories"
  add_foreign_key "job_competencies", "jobs"
end
