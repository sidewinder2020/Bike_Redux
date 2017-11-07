class Productcategory < ApplicationRecord
  has_many :productsubcategories

  def self.worst_performing_categories
    find_by_sql('select productcategories.name, count(salesorderheaders.id) as category_count from productcategories join productsubcategories on productcategories.id = productsubcategories.productcategory_id join products on products.productsubcategory_id = productsubcategories.id join salesorderdetails on products.id = salesorderdetails.product_id join salesorderheaders on salesorderheaders.id = salesorderdetails.salesorderheader_id where salesorderheaders.status = 5 group by productcategories.name order by category_count asc')
  end
end
