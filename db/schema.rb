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

ActiveRecord::Schema.define(version: 20170925194239) do

  create_table "bitcoin_payment_transactions", force: :cascade do |t|
    t.integer "estimated_value"
    t.string "transaction_hash"
    t.string "block_hash"
    t.datetime "block_time"
    t.datetime "estimated_time"
    t.integer "bitcoin_payment_id"
    t.integer "btc_conversion"
    t.index ["bitcoin_payment_id"], name: "index_bitcoin_payment_transactions_on_bitcoin_payment_id"
  end

  create_table "bitcoin_payments", force: :cascade do |t|
    t.string "payable_type"
    t.integer "payable_id"
    t.string "currency"
    t.string "reason"
    t.integer "price"
    t.float "btc_amount_due", default: 0.0
    t.string "address"
    t.string "state", default: "pending"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "btc_conversion"
    t.index ["payable_type", "payable_id"], name: "index_bitcoin_payments_on_payable_type_and_payable_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "commontator_comments", force: :cascade do |t|
    t.string "creator_type"
    t.integer "creator_id"
    t.string "editor_type"
    t.integer "editor_id"
    t.integer "thread_id", null: false
    t.text "body", null: false
    t.datetime "deleted_at"
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cached_votes_down"], name: "index_commontator_comments_on_cached_votes_down"
    t.index ["cached_votes_up"], name: "index_commontator_comments_on_cached_votes_up"
    t.index ["creator_id", "creator_type", "thread_id"], name: "index_commontator_comments_on_c_id_and_c_type_and_t_id"
    t.index ["thread_id", "created_at"], name: "index_commontator_comments_on_thread_id_and_created_at"
  end

  create_table "commontator_subscriptions", force: :cascade do |t|
    t.string "subscriber_type", null: false
    t.integer "subscriber_id", null: false
    t.integer "thread_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subscriber_id", "subscriber_type", "thread_id"], name: "index_commontator_subscriptions_on_s_id_and_s_type_and_t_id", unique: true
    t.index ["thread_id"], name: "index_commontator_subscriptions_on_thread_id"
  end

  create_table "commontator_threads", force: :cascade do |t|
    t.string "commontable_type"
    t.integer "commontable_id"
    t.datetime "closed_at"
    t.string "closer_type"
    t.integer "closer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commontable_id", "commontable_type"], name: "index_commontator_threads_on_c_id_and_c_type", unique: true
  end

  create_table "currency_conversions", force: :cascade do |t|
    t.float "currency"
    t.integer "btc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "donations", force: :cascade do |t|
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "project_id"
    t.integer "user_id"
    t.index ["project_id"], name: "index_donations_on_project_id"
    t.index ["user_id"], name: "index_donations_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "description", default: "", null: false
    t.float "target", default: 0.0, null: false
    t.float "balance", default: 0.0, null: false
    t.text "full_description", default: "", null: false
    t.datetime "expiration_time", default: "2001-09-11 00:00:00", null: false
    t.boolean "finished", default: false, null: false
    t.boolean "successful"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "category_id"
    t.string "avatar"
    t.boolean "chosen", default: false
    t.index ["category_id"], name: "index_projects_on_category_id"
    t.index ["chosen"], name: "index_projects_on_chosen"
    t.index ["description"], name: "index_projects_on_description"
    t.index ["name"], name: "index_projects_on_name"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "full_name", default: "", null: false
    t.integer "rating", default: 0, null: false
    t.boolean "admin", default: false, null: false
    t.boolean "validated", default: false, null: false
    t.boolean "sex"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "avatar"
    t.string "wallet"
    t.integer "validation_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["validation_id"], name: "index_users_on_validation_id"
  end

  create_table "validations", force: :cascade do |t|
    t.string "no"
    t.date "expiration_date"
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "country"
    t.string "city"
    t.string "index"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "scan"
    t.integer "user_id"
    t.index ["user_id"], name: "index_validations_on_user_id"
  end

end
