class Salesorderheader < ApplicationRecord
  belongs_to :salesperson, optional: true
  belongs_to :salesterritory
  has_many :salesorderheadersalesreasons
  has_many :salesorderdetails
end
