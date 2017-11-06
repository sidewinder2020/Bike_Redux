class Product < ApplicationRecord
  belongs_to :productsubcategory, optional: true
  has_many :productreviews
  has_many :productlistpricehistories
  has_many :productinventories
end
