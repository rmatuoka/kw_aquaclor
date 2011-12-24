class Product < ActiveRecord::Base
  has_many :products_receipts, :dependent => :destroy
  has_many :receipts, :through => :products_receipts
end
