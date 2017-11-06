class Salesperson < ApplicationRecord
  belongs_to :salesterritory, optional: true
  has_many :stores
  has_many :salesorderheaders
end
