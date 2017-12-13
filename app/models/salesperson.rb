class Salesperson < ApplicationRecord
  belongs_to :salesterritory, optional: true
  has_many :stores
  has_many :salesorderheaders

  def self.top_business_salespeople
    find_by_sql('select
        id,
        salesytd
      from salespeople
      order by salesytd desc')
  end

  def self.difference_bt_this_year_last_year_sales
    find_by_sql('select
        id,
        (salesytd - saleslastyear) as difference
      from salespeople
      order by difference desc')
  end
end
