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

ActiveRecord::Schema.define(version: 2021_09_13_100506) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "stack"
    t.string "github_link"
    t.string "website_link"
    t.string "staff_size"
    t.boolean "is_it_recruiting"
    t.bigint "company_category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_category_id"], name: "index_companies_on_company_category_id"
  end

  create_table "companies_stacks", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "stack_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_companies_stacks_on_company_id"
    t.index ["stack_id"], name: "index_companies_stacks_on_stack_id"
  end

  create_table "company_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stack_categories", force: :cascade do |t|
    t.bigint "stack_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stack_id"], name: "index_stack_categories_on_stack_id"
  end

  create_table "stacks", force: :cascade do |t|
    t.string "name"
    t.bigint "stack_category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stack_category_id"], name: "index_stacks_on_stack_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "description"
    t.string "stack"
    t.string "github_link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users_stacks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "stack_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stack_id"], name: "index_users_stacks_on_stack_id"
    t.index ["user_id"], name: "index_users_stacks_on_user_id"
  end

end
