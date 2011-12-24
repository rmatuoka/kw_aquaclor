class Receipt < ActiveRecord::Base
  belongs_to :reseller
  has_many :products_receipts
  has_many :products, :through => :products_receipts
end
