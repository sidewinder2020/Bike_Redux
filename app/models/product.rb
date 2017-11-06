class Product < ApplicationRecord
  belongs_to :productsubcategory
  has_many :productreviews
  has_many :productlistpricehistories
  has_many :productinventories
end
