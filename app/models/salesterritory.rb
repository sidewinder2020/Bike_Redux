class Salesterritory < ApplicationRecord
  has_many :salesorderheaders
  has_many :salespeople

  def self.highest_grossing_regions
    find_by_sql('select name, salesytd from salesterritories')
  end
end
