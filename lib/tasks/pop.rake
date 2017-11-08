namespace :pop do

  desc "populate productcategories table from CSV to postgresql table"
  task :productcategories => :environment do
    puts "You are running rake task in #{Rails.env} environment"
    Productcategory.copy_from "db/csv/productcategory.csv",
    :map => {
      'id' => 'id',
      'name' => 'name',
      'rowguid' => 'rowguid',
      'modifieddate' => 'modifieddate'}
  end

#   desc "populate customers table from CSV to postgresql table"
#   task :customers => :environment do
#   puts "You are running rake task in #{Rails.env} environment"
#     Customer.copy_from "db/data/customers.csv",
#     :map => {
#       'id' => 'id',
#       'first_name' => 'first_name',
#       'last_name' => 'last_name',
#       'created_at' => 'created_at',
#       'updated_at' => 'updated_at'}
#   end
#
#   desc "populate items table from CSV to postgresql table"
#   task :items => :environment do
#   puts "You are running rake task in #{Rails.env} environment"
#     Item.copy_from "db/data/items.csv",
#     :map => {
#       'id' => 'id',
#       'name' => 'name',
#       'description' => 'description',
#       'unit_price' => 'unit_price',
#       'merchant_id' => 'merchant_id',
#       'created_at' => 'created_at',
#       'updated_at' => 'updated_at'}
#   end
#
#   desc "populate invoices table from CSV to postgresql table"
#   task :invoices => :environment do
#     puts "You are running rake task in #{Rails.env} environment"
#     Invoice.copy_from "db/data/invoices.csv",
#     :map => {
#       'id' => 'id',
#       'customer_id' => 'customer_id',
#       'merchant_id' => 'merchant_id',
#       'status' => 'status',
#       'created_at' => 'created_at',
#       'updated_at' => 'updated_at'}
#     end
#
#   desc "populate invoice items table from CSV to postgresql table"
#   task :invoiceitems => :environment do
#   puts "You are running rake task in #{Rails.env} environment"
#     InvoiceItem.copy_from "db/data/invoice_items.csv",
#     :map => {
#       'id' => 'id',
#       'item_id' => 'item_id',
#       'invoice_id' => 'invoice_id',
#       'quantity' => 'quantity',
#       'unit_price' => 'unit_price',
#       'created_at' => 'created_at',
#       'updated_at' => 'updated_at'}
#   end
#
#   desc "populate transactions table from CSV to postgresql table"
#   task :transactions => :environment do
#   puts "You are running rake task in #{Rails.env} environment"
#     Transaction.copy_from "db/data/transactions.csv",
#     :map => {
#       'id' => 'id',
#       'invoice_id' => 'invoice_id',
#       'credit_card_number' => 'credit_card_number',
#       'credit_card_expiration_date' => 'credit_card_expiration_date',
#       'result' => 'result',
#       'created_at' => 'created_at',
#       'updated_at' => 'updated_at'}
#   end
#
#   desc "populate all tables"
#   task :all => [:merchants, :customers, :items, :invoices, :invoiceitems, :transactions]
# endnamespace :pop do
#
#   desc "populate merchants table from CSV to postgresql table"
#   task :merchants => :environment do
#     puts "You are running rake task in #{Rails.env} environment"
#     Merchant.copy_from "db/data/merchants.csv",
#     :map => {
#       'id' => 'id',
#       'name' => 'name',
#       'created_at' => 'created_at',
#       'updated_at' => 'updated_at'}
#   end
#
#   desc "populate customers table from CSV to postgresql table"
#   task :customers => :environment do
#   puts "You are running rake task in #{Rails.env} environment"
#     Customer.copy_from "db/data/customers.csv",
#     :map => {
#       'id' => 'id',
#       'first_name' => 'first_name',
#       'last_name' => 'last_name',
#       'created_at' => 'created_at',
#       'updated_at' => 'updated_at'}
#   end
#
#   desc "populate items table from CSV to postgresql table"
#   task :items => :environment do
#   puts "You are running rake task in #{Rails.env} environment"
#     Item.copy_from "db/data/items.csv",
#     :map => {
#       'id' => 'id',
#       'name' => 'name',
#       'description' => 'description',
#       'unit_price' => 'unit_price',
#       'merchant_id' => 'merchant_id',
#       'created_at' => 'created_at',
#       'updated_at' => 'updated_at'}
#   end
#
#   desc "populate invoices table from CSV to postgresql table"
#   task :invoices => :environment do
#     puts "You are running rake task in #{Rails.env} environment"
#     Invoice.copy_from "db/data/invoices.csv",
#     :map => {
#       'id' => 'id',
#       'customer_id' => 'customer_id',
#       'merchant_id' => 'merchant_id',
#       'status' => 'status',
#       'created_at' => 'created_at',
#       'updated_at' => 'updated_at'}
#     end
#
#   desc "populate invoice items table from CSV to postgresql table"
#   task :invoiceitems => :environment do
#   puts "You are running rake task in #{Rails.env} environment"
#     InvoiceItem.copy_from "db/data/invoice_items.csv",
#     :map => {
#       'id' => 'id',
#       'item_id' => 'item_id',
#       'invoice_id' => 'invoice_id',
#       'quantity' => 'quantity',
#       'unit_price' => 'unit_price',
#       'created_at' => 'created_at',
#       'updated_at' => 'updated_at'}
#   end
#
#   desc "populate transactions table from CSV to postgresql table"
#   task :transactions => :environment do
#   puts "You are running rake task in #{Rails.env} environment"
#     Transaction.copy_from "db/data/transactions.csv",
#     :map => {
#       'id' => 'id',
#       'invoice_id' => 'invoice_id',
#       'credit_card_number' => 'credit_card_number',
#       'credit_card_expiration_date' => 'credit_card_expiration_date',
#       'result' => 'result',
#       'created_at' => 'created_at',
#       'updated_at' => 'updated_at'}
#   end

  # desc "populate all tables"
  # task :all => [:, :customers, :items, :invoices, :invoiceitems, :transactions]
end
