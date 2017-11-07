class Store < ApplicationRecord
  belongs_to :salesperson

  def self.top_selling_products(store_id)
    find_by_sql("select products.name, count(salesorderheaders.id) as order_count from stores join salespeople on salespeople.id = stores.salesperson_id join salesorderheaders on salesorderheaders.salesperson_id = salespeople.id join salesorderdetails on salesorderdetails.salesorderheader_id = salesorderheaders.id join products on products.id = salesorderdetails.product_id where stores.id = #{store_id} and salesorderheaders.status = 5 group by products.name order by order_count desc limit 25")
  end

  def self.salesytd_per_store(store_id)
    find_by_sql("select stores.name, salespeople.salesytd from stores join salespeople on salespeople.id = stores.salesperson_id where stores.id = #{store_id}")
  end

  def self.territory_area(store_id)
    find_by_sql("select stores.name, salesterritories.name from stores join salespeople on salespeople.id = stores.salesperson_id join salesterritories on salesterritories.id = salespeople.salesterritory_id where stores.id = #{store_id}")
  end

  def self.number_of_orders(store_id)
    find_by_sql("select stores.name, count(salesorderheaders.id) as order_count from stores join salespeople on salespeople.id = stores.salesperson_id join salesorderheaders on salespeople.id = salesorderheaders.salesperson_id where salesorderheaders.status = 5 and stores.id = #{store_id} group by stores.name")
  end

  def self.orders_total_cost(store_id)
    find_by_sql("select stores.name, sum(salesorderheaders.totaldue) as order_total from stores join salespeople on salespeople.id = stores.salesperson_id join salesorderheaders on salespeople.id = salesorderheaders.salesperson_id where salesorderheaders.status = 5 and stores.id = #{store_id} group by stores.name")
  end
end
