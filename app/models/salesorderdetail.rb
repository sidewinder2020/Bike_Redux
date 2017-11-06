class Salesorderdetail < ApplicationRecord
  belongs_to :salesorderheader
  belongs_to :product
end
