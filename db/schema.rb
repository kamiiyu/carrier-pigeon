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

ActiveRecord::Schema.define(version: 20170206053822) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer  "attempt_id"
    t.integer  "question_id"
    t.integer  "input_id"
    t.text     "text"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.json     "extension"
    t.integer  "user_id"
    t.integer  "sort",        default: 0
    t.index ["attempt_id"], name: "index_answers_on_attempt_id", using: :btree
    t.index ["input_id"], name: "index_answers_on_input_id", using: :btree
    t.index ["question_id"], name: "index_answers_on_question_id", using: :btree
    t.index ["user_id"], name: "index_answers_on_user_id", using: :btree
  end

  create_table "attempt_logs", force: :cascade do |t|
    t.integer  "attempt_id", null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attempt_id"], name: "index_attempt_logs_on_attempt_id", using: :btree
    t.index ["user_id"], name: "index_attempt_logs_on_user_id", using: :btree
  end

  create_table "attempt_reviewers", force: :cascade do |t|
    t.integer "reviewer_user_id",             null: false
    t.integer "user_id",                      null: false
    t.integer "reviewer_type",    default: 1, null: false
    t.integer "attempt_id"
    t.index ["attempt_id"], name: "index_attempt_reviewers_on_attempt_id", using: :btree
    t.index ["reviewer_user_id"], name: "index_attempt_reviewers_on_reviewer_user_id", using: :btree
    t.index ["user_id"], name: "index_attempt_reviewers_on_user_id", using: :btree
  end

  create_table "attempts", force: :cascade do |t|
    t.integer  "survey_id"
    t.integer  "user_id"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "worksheet_name"
    t.date     "started_at",               default: '2016-07-01', null: false
    t.date     "ended_at",                 default: '2016-07-31', null: false
    t.date     "review_period_started_at", default: '2016-01-01', null: false
    t.date     "review_period_ended_at",   default: '2016-07-01', null: false
    t.string   "job_title_change_date"
    t.integer  "job_title_id"
    t.integer  "status",                   default: 0,            null: false
    t.integer  "review_id"
    t.integer  "change_job_title_id"
    t.integer  "department_id"
    t.integer  "team_id"
    t.text     "axlsx"
    t.index ["change_job_title_id"], name: "index_attempts_on_change_job_title_id", using: :btree
    t.index ["department_id"], name: "index_attempts_on_department_id", using: :btree
    t.index ["job_title_id"], name: "index_attempts_on_job_title_id", using: :btree
    t.index ["review_id"], name: "index_attempts_on_review_id", using: :btree
    t.index ["survey_id"], name: "index_attempts_on_survey_id", using: :btree
    t.index ["team_id"], name: "index_attempts_on_team_id", using: :btree
    t.index ["user_id"], name: "index_attempts_on_user_id", using: :btree
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "data_fingerprint"
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type", using: :btree
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.integer  "manager_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_active",  default: true, null: false
    t.index ["manager_id"], name: "index_departments_on_manager_id", using: :btree
  end

  create_table "departments_events", force: :cascade do |t|
    t.integer  "department_id"
    t.integer  "event_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["department_id"], name: "index_departments_events_on_department_id", using: :btree
    t.index ["event_id"], name: "index_departments_events_on_event_id", using: :btree
  end

  create_table "employment_types", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.boolean  "attended",   default: false
    t.text     "feedback"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["event_id"], name: "index_enrollments_on_event_id", using: :btree
    t.index ["user_id"], name: "index_enrollments_on_user_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "event_type"
    t.text     "description"
    t.string   "organizer",             default: "XO Group"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.datetime "enrollment_started_at"
    t.datetime "enrollment_ended_at"
    t.integer  "capacity",              default: -1
    t.boolean  "public",                default: true
    t.text     "remarks"
    t.integer  "user_id"
    t.string   "status"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "location"
    t.integer  "owner_id"
    t.index ["event_type"], name: "index_events_on_event_type", using: :btree
    t.index ["owner_id"], name: "index_events_on_owner_id", using: :btree
    t.index ["user_id"], name: "index_events_on_user_id", using: :btree
  end

  create_table "inputs", force: :cascade do |t|
    t.integer  "question_id"
    t.string   "input_type"
    t.integer  "input_id"
    t.text     "text"
    t.json     "input_options"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "cell",                       array: true
    t.index ["input_id"], name: "index_inputs_on_input_id", using: :btree
    t.index ["question_id"], name: "index_inputs_on_question_id", using: :btree
  end

  create_table "job_titles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_active",  default: true, null: false
  end

  create_table "promotions", force: :cascade do |t|
    t.integer  "user_id",      null: false
    t.integer  "job_title_id", null: false
    t.date     "started_at",   null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["job_title_id"], name: "index_promotions_on_job_title_id", using: :btree
    t.index ["user_id"], name: "index_promotions_on_user_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "survey_id"
    t.text     "text"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "sort",             default: 0
    t.json     "question_options"
    t.index ["survey_id"], name: "index_questions_on_survey_id", using: :btree
  end

  create_table "queue_classic_jobs", id: :bigserial, force: :cascade do |t|
    t.text     "q_name",                                null: false
    t.text     "method",                                null: false
    t.json     "args",                                  null: false
    t.datetime "locked_at"
    t.integer  "locked_by"
    t.datetime "created_at",   default: -> { "now()" }
    t.datetime "scheduled_at", default: -> { "now()" }
    t.index ["q_name", "id"], name: "idx_qc_on_name_only_unlocked", where: "(locked_at IS NULL)", using: :btree
    t.index ["scheduled_at", "id"], name: "idx_qc_on_scheduled_at_only_unlocked", where: "(locked_at IS NULL)", using: :btree
  end

  create_table "review_types", force: :cascade do |t|
    t.string   "name",                      null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "is_active",  default: true, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "name",                           null: false
    t.date     "started_at",                     null: false
    t.date     "ended_at",                       null: false
    t.date     "period_started_at",              null: false
    t.date     "period_ended_at",                null: false
    t.integer  "open_to",                        null: false
    t.json     "open_to_user_ids",  default: [], null: false
    t.integer  "total",                          null: false
    t.integer  "status",            default: 1,  null: false
    t.integer  "review_type_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.text     "axlsx"
    t.index ["review_type_id"], name: "index_reviews_on_review_type_id", using: :btree
  end

  create_table "supervisors", force: :cascade do |t|
    t.integer "supervisor_user_id"
    t.integer "user_id"
    t.integer "supervisor_type"
    t.index ["supervisor_user_id"], name: "index_supervisors_on_supervisor_user_id", using: :btree
    t.index ["user_id"], name: "index_supervisors_on_user_id", using: :btree
  end

  create_table "survey_job_titles", force: :cascade do |t|
    t.integer  "survey_id"
    t.integer  "job_title_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["job_title_id"], name: "index_survey_job_titles_on_job_title_id", using: :btree
    t.index ["survey_id"], name: "index_survey_job_titles_on_survey_id", using: :btree
  end

  create_table "surveys", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.date     "started_at"
    t.date     "ended_at"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "status",         default: 0
    t.integer  "review_type_id"
    t.datetime "activated_at"
    t.datetime "archived_at"
    t.index ["review_type_id"], name: "index_surveys_on_review_type_id", using: :btree
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "leader_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_active",  default: true, null: false
    t.index ["leader_id"], name: "index_teams_on_leader_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "first_name",                               null: false
    t.string   "last_name",                                null: false
    t.string   "chinese_name",                             null: false
    t.integer  "gender",                                   null: false
    t.date     "on_board_at"
    t.integer  "birthday_month"
    t.integer  "department_id"
    t.integer  "job_title_id"
    t.integer  "team_id"
    t.json     "tokens"
    t.string   "provider",               default: "email"
    t.string   "uid",                    default: ""
    t.date     "on_resigned_at"
    t.integer  "status",                 default: 1,       null: false
    t.string   "id_card"
    t.string   "role",                   default: "User",  null: false
    t.integer  "manager_id"
    t.integer  "employment_type_id"
    t.date     "contract_end_date"
    t.index ["department_id"], name: "index_users_on_department_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["employment_type_id"], name: "index_users_on_employment_type_id", using: :btree
    t.index ["job_title_id"], name: "index_users_on_job_title_id", using: :btree
    t.index ["manager_id"], name: "index_users_on_manager_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["team_id"], name: "index_users_on_team_id", using: :btree
  end

  add_foreign_key "answers", "attempts"
  add_foreign_key "answers", "inputs"
  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "attempt_logs", "attempts"
  add_foreign_key "attempt_logs", "users"
  add_foreign_key "attempt_reviewers", "attempts"
  add_foreign_key "attempt_reviewers", "users"
  add_foreign_key "attempt_reviewers", "users", column: "reviewer_user_id"
  add_foreign_key "attempts", "departments"
  add_foreign_key "attempts", "job_titles"
  add_foreign_key "attempts", "job_titles", column: "change_job_title_id"
  add_foreign_key "attempts", "reviews"
  add_foreign_key "attempts", "surveys"
  add_foreign_key "attempts", "teams"
  add_foreign_key "attempts", "users"
  add_foreign_key "departments_events", "departments"
  add_foreign_key "departments_events", "events"
  add_foreign_key "enrollments", "events"
  add_foreign_key "enrollments", "users"
  add_foreign_key "events", "users"
  add_foreign_key "events", "users", column: "owner_id"
  add_foreign_key "inputs", "inputs"
  add_foreign_key "inputs", "questions"
  add_foreign_key "promotions", "job_titles"
  add_foreign_key "promotions", "users"
  add_foreign_key "questions", "surveys"
  add_foreign_key "reviews", "review_types"
  add_foreign_key "supervisors", "users"
  add_foreign_key "supervisors", "users", column: "supervisor_user_id"
  add_foreign_key "survey_job_titles", "job_titles"
  add_foreign_key "survey_job_titles", "surveys"
  add_foreign_key "surveys", "review_types"
  add_foreign_key "users", "departments"
  add_foreign_key "users", "employment_types"
  add_foreign_key "users", "job_titles"
  add_foreign_key "users", "teams"
end
