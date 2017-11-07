class Salesreason < ApplicationRecord
  has_many :salesorderheadersalesreasons

  def most_popular_salesreasons
    find_by_sql('')
  end
end
