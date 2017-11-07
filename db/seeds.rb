require 'csv'

# Productinventory.destroy_all
Salesorderheadersalesreason.destroy_all
Salesreason.destroy_all
Salesorderdetail.destroy_all
Salesorderheader.destroy_all
Store.destroy_all
Salesperson.destroy_all
Salesterritory.destroy_all
Productlistpricehistory.destroy_all
Productreview.destroy_all
Product.destroy_all
Productsubcategory.destroy_all
Productcategory.destroy_all

productcategories = CSV.foreach "./db/csv/productcategory.csv", headers: true, header_converters: :symbol
productsubcategories = CSV.foreach "./db/csv/productsubcategory.csv", headers: true, header_converters: :symbol
product = CSV.foreach "./db/csv/product.csv", headers: true, header_converters: :symbol
productreviews = CSV.foreach "./db/csv/productreview.csv", headers: true, header_converters: :symbol
productinventories = CSV.foreach "./db/csv/productinventory.csv", headers: true, header_converters: :symbol
productlistpricehistories = CSV.foreach "./db/csv/productlistpricehistory.csv", headers: true, header_converters: :symbol
salesterritories = CSV.foreach "./db/csv/salesterritory.csv", headers: true, header_converters: :symbol
salespeople = CSV.foreach "./db/csv/salesperson.csv", headers: true, header_converters: :symbol
stores = CSV.foreach "./db/csv/sales_store.csv", headers: true, header_converters: :symbol
salesorderheaders = CSV.foreach "./db/csv/salesorderheader.csv", headers: true, header_converters: :symbol
salesorderdetails = CSV.foreach "./db/csv/salesorderdetail.csv", headers: true, header_converters: :symbol
salesreasons = CSV.foreach "./db/csv/salesreason.csv", headers: true, header_converters: :symbol
salesorderheadersalesreasons = CSV.foreach "./db/csv/salesorderheadersalesreason.csv", headers: true, header_converters: :symbol

productcategories.each do |row|
  category = row.to_hash
  category[:modifieddate] = Date.parse(row[:modifieddate]) if row[:modifieddate]
  Productcategory.create!(category)
end
puts "finished categories"

productsubcategories.each do |row|
  subcategory = row.to_hash
  subcategory[:modifieddate] = Date.parse(row[:modifieddate]) if row[:modifieddate]
  Productsubcategory.create!(subcategory)
end
puts "finished subcategories"

product.each do |row|
  product = row.to_hash
  product[:sellstartdate] = Date.parse(row[:sellstartdate])
  product[:sellenddate] = Date.parse(row[:sellenddate]) if row[:sellenddate]
  product[:discontinueddate] = Date.parse(row[:discontinueddate]) if row[:discontinueddate]
  product[:modifieddate] = Date.parse(row[:modifieddate]) if row[:modifieddate]
  Product.create!(product)
end
puts "finished products"

productreviews.each do |row|
  productreview = row.to_hash
  productreview[:modifieddate] = Date.parse(row[:modifieddate]) if row[:modifieddate]
  Productreview.create!(productreview)
end
puts "finished productreviews"

productinventories.each do |row|
  productinventory = row.to_hash
  productinventory[:modifieddate] = Date.parse(row[:modifieddate]) if row[:modifieddate]
  Productinventory.create!(productinventory)
end
puts "finished productinventories"

productlistpricehistories.each do |row|
  productlistpricehistory = row.to_hash
  productlistpricehistory[:startdate] = Date.parse(row[:startdate])
  productlistpricehistory[:enddate] = Date.parse(row[:enddate]) if row[:enddate]
  productlistpricehistory[:modifieddate] = Date.parse(row[:modifieddate]) if row[:modifieddate]
  Productlistpricehistory.create!(productlistpricehistory)
end
puts "finished productlistpricehistory"

salesterritories.each do |row|
  salesterritory = row.to_hash
  salesterritory[:modifieddate] = Date.parse(row[:modifieddate]) if row[:modifieddate]
  Salesterritory.create!(salesterritory)
end
puts "finished salesterritory"

salespeople.each do |row|
  salesperson = row.to_hash
  salesperson[:modifieddate] = Date.parse(row[:modifieddate]) if row[:modifieddate]
  Salesperson.create!(salesperson)
end
puts "finished salesperson"

stores.each do |row|
  store = row.to_hash
  store[:modifieddate] = Date.parse(row[:modifieddate]) if row[:modifieddate]
  Store.create!(store)
end
puts "finished stores"

salesorderheaders.each do |row|
  salesorderheader = row.to_hash
  salesorderheader[:orderdate] = Date.parse(row[:orderdate]) if row[:orderdate]
  salesorderheader[:modifieddate] = Date.parse(row[:modifieddate]) if row[:modifieddate]
  Salesorderheader.create!(salesorderheader)
end
puts "finished salesorderheaders"

salesorderdetails.each do |row|
  salesorderdetail = row.to_hash
  salesorderdetail[:modifieddate] = Date.parse(row[:modifieddate]) if row[:modifieddate]
  Salesorderdetail.create!(salesorderdetail)
end
puts "finished salesorderdetails"

salesreasons.each do |row|
  salesreason = row.to_hash
  salesreason[:modifieddate] = Date.parse(row[:modifieddate]) if row[:modifieddate]
  Salesreason.create!(salesreason)
end
puts "finished salesreasons"

salesorderheadersalesreasons.each do |row|
  salesorderheadersalesreason = row.to_hash
  salesorderheadersalesreason[:modifieddate] = Date.parse(row[:modifieddate]) if row[:modifieddate]
  Salesorderheadersalesreason.create!(salesorderheadersalesreason)
end
puts "finished salesorderheadersalesreason"
