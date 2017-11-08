class Salesreason < ApplicationRecord
  has_many :salesorderheadersalesreasons

  def self.most_popular_salesreasons
    find_by_sql('select count(salesorderheaders.id) as reason_count, salesreasons.reasontype from salesorderheaders join salesorderheadersalesreasons on salesorderheadersalesreasons.salesorderheader_id = salesorderheaders.id join salesreasons on salesreasons.id = salesorderheadersalesreasons.salesreason_id group by salesreasons.reasontype order by reason_count desc')
  end
end
