class Product < ApplicationRecord
  acts_as_copy_target
  belongs_to :productsubcategory, optional: true
  has_many :productreviews
  has_many :productlistpricehistories

  def self.most_popular
    find_by_sql('select
        products.name,
        count(salesorderdetails.id) as order_count
      from products
        join salesorderdetails on products.id = salesorderdetails.product_id
      group by products.name
      order by order_count desc
      limit 10')
  end
end
