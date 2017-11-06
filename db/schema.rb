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

ActiveRecord::Schema.define(version: 20171106020715) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "productcategories", force: :cascade do |t|
    t.string "name"
    t.string "rowguid"
    t.date "modifieddate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "productinventories", id: false, force: :cascade do |t|
    t.bigint "id"
    t.bigint "productid"
    t.string "rowguid"
    t.date "modifieddate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "productlistpricehistories", force: :cascade do |t|
    t.bigint "product_id"
    t.date "startdate"
    t.date "enddate"
    t.decimal "listprice"
    t.date "modifieddate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_productlistpricehistories_on_product_id"
  end

  create_table "productreviews", force: :cascade do |t|
    t.bigint "product_id"
    t.string "reviewername"
    t.integer "rating"
    t.string "comments"
    t.date "modifieddate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_productreviews_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.decimal "standardcost"
    t.decimal "listprice"
    t.integer "daystomanufacture"
    t.bigint "productsubcategory_id"
    t.date "sellstartdate"
    t.date "sellenddate"
    t.date "discontinueddate"
    t.string "rowguid"
    t.date "modifieddate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["productsubcategory_id"], name: "index_products_on_productsubcategory_id"
  end

  create_table "productsubcategories", force: :cascade do |t|
    t.bigint "productcategory_id"
    t.string "name"
    t.string "rowguid"
    t.date "modifieddate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["productcategory_id"], name: "index_productsubcategories_on_productcategory_id"
  end

  create_table "salesorderdetails", force: :cascade do |t|
    t.bigint "salesorderheader_id"
    t.integer "orderqty"
    t.bigint "product_id"
    t.decimal "unitprice"
    t.string "rowguid"
    t.date "modifieddate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_salesorderdetails_on_product_id"
    t.index ["salesorderheader_id"], name: "index_salesorderdetails_on_salesorderheader_id"
  end

  create_table "salesorderheaders", force: :cascade do |t|
    t.date "orderdate"
    t.integer "status"
    t.boolean "onlineorderflag"
    t.integer "customerid"
    t.bigint "salesperson_id"
    t.bigint "salesterritory_id"
    t.integer "currencyrateid"
    t.decimal "totaldue"
    t.string "rowguid"
    t.date "modifieddate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["salesperson_id"], name: "index_salesorderheaders_on_salesperson_id"
    t.index ["salesterritory_id"], name: "index_salesorderheaders_on_salesterritory_id"
  end

  create_table "salesorderheadersalesreasons", force: :cascade do |t|
    t.bigint "salesorderheader_id"
    t.bigint "salesreason_id"
    t.date "modifieddate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["salesorderheader_id"], name: "index_salesorderheadersalesreasons_on_salesorderheader_id"
    t.index ["salesreason_id"], name: "index_salesorderheadersalesreasons_on_salesreason_id"
  end

  create_table "salespeople", force: :cascade do |t|
    t.bigint "salesterritory_id"
    t.decimal "bonus"
    t.decimal "commissionpct"
    t.decimal "salesytd"
    t.decimal "saleslastyear"
    t.string "rowguid"
    t.date "modifieddate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["salesterritory_id"], name: "index_salespeople_on_salesterritory_id"
  end

  create_table "salesreasons", force: :cascade do |t|
    t.string "name"
    t.string "reasontype"
    t.date "modifieddate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "salesterritories", force: :cascade do |t|
    t.string "name"
    t.string "countryregioncode"
    t.string "group"
    t.decimal "salesytd"
    t.decimal "saleslastyear"
    t.string "rowguid"
    t.date "modifieddate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.bigint "salesperson_id"
    t.string "rowguid"
    t.date "modifieddate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["salesperson_id"], name: "index_stores_on_salesperson_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "productlistpricehistories", "products"
  add_foreign_key "productreviews", "products"
  add_foreign_key "products", "productsubcategories"
  add_foreign_key "productsubcategories", "productcategories"
  add_foreign_key "salesorderdetails", "products"
  add_foreign_key "salesorderdetails", "salesorderheaders"
  add_foreign_key "salesorderheaders", "salespeople"
  add_foreign_key "salesorderheaders", "salesterritories"
  add_foreign_key "salesorderheadersalesreasons", "salesorderheaders"
  add_foreign_key "salesorderheadersalesreasons", "salesreasons"
  add_foreign_key "salespeople", "salesterritories"
  add_foreign_key "stores", "salespeople"
end
