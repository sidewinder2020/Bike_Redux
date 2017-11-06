class Salesterritory < ApplicationRecord
  has_many :salesorderheaders
  has_many :salespeople
end
