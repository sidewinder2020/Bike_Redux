require 'csv'
require 'database_cleaner'

namespace :pop do

  desc "cleans db with Database Cleaner"
  task :cleardb => :environment do
    DatabaseCleaner.clean_with(:truncation)
  end

  desc "populate productcategories table from CSV to postgresql table"
  task :productcategories => :environment do
    puts "You are running rake task in #{Rails.env} environment"
    productcategories = CSV.foreach "./db/csv/productcategory.csv", headers: true, header_converters: :symbol
      productcategories.each do |row|
        category = row.to_hash
        category[:modifieddate] = Date.parse(row[:modifieddate]) if row[:modifieddate]
        Productcategory.create!(category)
      end
  end

  desc "populate productsubcategories table from CSV to postgresql table"
  task :productsubcategories => :environment do
  puts "You are running rake task in #{Rails.env} environment"
  productsubcategories = CSV.foreach "./db/csv/productsubcategory.csv", headers: true, header_converters: :symbol
    productsubcategories.each do |row|
      subcategory = row.to_hash
      subcategory[:modifieddate] = Date.parse(row[:modifieddate]) if row[:modifieddate]
      Productsubcategory.create!(subcategory)
    end
    puts "finished subcategories"
  end

  desc "populate products table from CSV to postgresql table"
  task :products => :environment do
  puts "You are running rake task in #{Rails.env} environment"
  product = CSV.foreach "./db/csv/product.csv", headers: true, header_converters: :symbol
    product.each do |row|
      product = row.to_hash
      product[:sellstartdate] = Date.parse(row[:sellstartdate])
      product[:sellenddate] = Date.parse(row[:sellenddate]) if row[:sellenddate]
      product[:discontinueddate] = Date.parse(row[:discontinueddate]) if row[:discontinueddate]
      product[:modifieddate] = Date.parse(row[:modifieddate]) if row[:modifieddate]
      Product.create!(product)
    end
    puts "finished products"
  end

  desc "populate productreviews table from CSV to postgresql table"
  task :productreviews => :environment do
  puts "You are running rake task in #{Rails.env} environment"
  productreviews = CSV.foreach "./db/csv/productreview.csv", headers: true, header_converters: :symbol
    productreviews.each do |row|
      productreview = row.to_hash
      productreview[:modifieddate] = Date.parse(row[:modifieddate]) if row[:modifieddate]
      Productreview.create!(productreview)
    end
    puts "finished productreviews"
  end

  desc "populate productinventories table from CSV to postgresql table"
  task :productinventories => :environment do
  puts "You are running rake task in #{Rails.env} environment"
  productinventories = CSV.foreach "./db/csv/productinventory.csv", headers: true, header_converters: :symbol
    productinventories.each do |row|
      productinventory = row.to_hash
      productinventory[:modifieddate] = Date.parse(row[:modifieddate]) if row[:modifieddate]
      Productinventory.create!(productinventory)
    end
    puts "finished productinventories"
  end

  desc "populate productlistpricehistories table from CSV to postgresql table"
  task :productlistpricehistories => :environment do
  puts "You are running rake task in #{Rails.env} environment"
  productlistpricehistories = CSV.foreach "./db/csv/productlistpricehistory.csv", headers: true, header_converters: :symbol
    productlistpricehistories.each do |row|
      productlistpricehistory = row.to_hash
      productlistpricehistory[:startdate] = Date.parse(row[:startdate])
      productlistpricehistory[:enddate] = Date.parse(row[:enddate]) if row[:enddate]
      productlistpricehistory[:modifieddate] = Date.parse(row[:modifieddate]) if row[:modifieddate]
      Productlistpricehistory.create!(productlistpricehistory)
    end
    puts "finished productlistpricehistory"
  end

  desc "populate salesterritories table from CSV to postgresql table"
  task :salesterritories => :environment do
  puts "You are running rake task in #{Rails.env} environment"
  salesterritories = CSV.foreach "./db/csv/salesterritory.csv", headers: true, header_converters: :symbol
    salesterritories.each do |row|
      salesterritory = row.to_hash
      salesterritory[:modifieddate] = Date.parse(row[:modifieddate]) if row[:modifieddate]
      Salesterritory.create!(salesterritory)
    end
    puts "finished salesterritory"
  end

  desc "populate salespeople table from CSV to postgresql table"
  task :salespeople => :environment do
  puts "You are running rake task in #{Rails.env} environment"
  salespeople = CSV.foreach "./db/csv/salesperson.csv", headers: true, header_converters: :symbol
    salespeople.each do |row|
      salesperson = row.to_hash
      salesperson[:modifieddate] = Date.parse(row[:modifieddate]) if row[:modifieddate]
      Salesperson.create!(salesperson)
    end
    puts "finished salesperson"
  end

  desc "populate stores table from CSV to postgresql table"
  task :stores => :environment do
  puts "You are running rake task in #{Rails.env} environment"
  stores = CSV.foreach "./db/csv/sales_store.csv", headers: true, header_converters: :symbol
    stores.each do |row|
      store = row.to_hash
      store[:modifieddate] = Date.parse(row[:modifieddate]) if row[:modifieddate]
      Store.create!(store)
    end
    puts "finished stores"
  end

  desc "populate salesorderheaders table from CSV to postgresql table"
  task :salesorderheaders => :environment do
  puts "You are running rake task in #{Rails.env} environment"
  salesorderheaders = CSV.foreach "./db/csv/salesorderheader.csv", headers: true, header_converters: :symbol
    salesorderheaders.each do |row|
      salesorderheader = row.to_hash
      salesorderheader[:orderdate] = Date.parse(row[:orderdate]) if row[:orderdate]
      salesorderheader[:modifieddate] = Date.parse(row[:modifieddate]) if row[:modifieddate]
      Salesorderheader.create!(salesorderheader)
    end
    puts "finished salesorderheaders"
  end

  desc "populate salesorderdetails table from CSV to postgresql table"
  task :salesorderdetails => :environment do
  puts "You are running rake task in #{Rails.env} environment"
  salesorderdetails = CSV.foreach "./db/csv/salesorderdetail.csv", headers: true, header_converters: :symbol
    salesorderdetails.each do |row|
      salesorderdetail = row.to_hash
      salesorderdetail[:modifieddate] = Date.parse(row[:modifieddate]) if row[:modifieddate]
      Salesorderdetail.create!(salesorderdetail)
    end
    puts "finished salesorderdetails"
  end

  desc "populate salesreasons table from CSV to postgresql table"
  task :salesreasons => :environment do
  puts "You are running rake task in #{Rails.env} environment"
  salesreasons = CSV.foreach "./db/csv/salesreason.csv", headers: true, header_converters: :symbol
    salesreasons.each do |row|
      salesreason = row.to_hash
      salesreason[:modifieddate] = Date.parse(row[:modifieddate]) if row[:modifieddate]
      Salesreason.create!(salesreason)
    end
    puts "finished salesreasons"
  end

  desc "populate salesorderheadersalesreasons table from CSV to postgresql table"
  task :salesorderheadersalesreasons => :environment do
  puts "You are running rake task in #{Rails.env} environment"
  salesorderheadersalesreasons = CSV.foreach "./db/csv/salesorderheadersalesreason.csv", headers: true, header_converters: :symbol
    salesorderheadersalesreasons.each do |row|
      salesorderheadersalesreason = row.to_hash
      salesorderheadersalesreason[:modifieddate] = Date.parse(row[:modifieddate]) if row[:modifieddate]
      Salesorderheadersalesreason.create!(salesorderheadersalesreason)
    end
    puts "finished salesorderheadersalesreason"
  end

end
