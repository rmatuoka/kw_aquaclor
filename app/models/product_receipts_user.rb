class ProductReceiptsUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :products_receipt
end
