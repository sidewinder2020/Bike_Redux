class Salesorderheader < ApplicationRecord
  belongs_to :salesperson
  belongs_to :salesterritory
  has_many :salesorderheadersalesreasons
  has_many :salesorderdetails
end
