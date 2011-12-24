class ProductsReceipt < ActiveRecord::Base
  belongs_to :product
  belongs_to :receipt  
  has_many :product_receipts_users, :dependent => :destroy
  has_many :users, :through => :product_receipts_users
end
