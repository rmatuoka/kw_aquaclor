class ProductReceiptsUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :product_receipt
end
