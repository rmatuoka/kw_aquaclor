class Product < ActiveRecord::Base
  has_many :products_receipts
  has_many :receipts, :through => :products_receipts
end
