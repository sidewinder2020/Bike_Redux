class Store < ApplicationRecord
  belongs_to :salesperson

  def self.top_selling_products
    find_by_sql('')
  end
end
