require 'csv'
require 'pry'

Product.destroy_all
Productcategory.destroy_all
Productsubcategory.destroy_all

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
