class Salesperson < ApplicationRecord
  belongs_to :territory
  has_many :stores
  has_many :salesorderheaders
end
