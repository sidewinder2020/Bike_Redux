class Salesorderheadersalesreason < ApplicationRecord
  belongs_to :salesorderheader
  belongs_to :salesreason
end
