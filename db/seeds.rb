require 'csv'
require 'pry'

# Product.destroy_all

product = CSV.foreach "./db/csv/product.csv", headers: true, header_converters: :symbol

product.each do |row|
  product = row.to_hash
  binding.pry
  product[:sellstartdate] = Date.parse(row[:sellstartdate])
  product[:sellenddate] = Date.parse(row[:sellenddate])
  product[:discontinueddate] = Date.parse(row[:discontinueddate])
  product[:modifieddate] = Date.parse(row[:modifieddate])
  # Product.create!(row)
  count += 1
  puts count
end
