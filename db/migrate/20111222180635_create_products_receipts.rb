class CreateProductsReceipts < ActiveRecord::Migration
  def self.up
    create_table :products_receipts do |t|
      t.integer :product_id
      t.integer :receipt_id
      t.integer :amount

      t.timestamps
    end
  end

  def self.down
    drop_table :products_receipts
  end
end
