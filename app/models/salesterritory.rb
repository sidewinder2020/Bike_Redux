class Salesterritory < ApplicationRecord
  has_many :salesorderheaders
  has_many :salespeople

  def self.sales_per_region
    find_by_sql('select
        name,
        salesytd
      from salesterritories')
  end
end
