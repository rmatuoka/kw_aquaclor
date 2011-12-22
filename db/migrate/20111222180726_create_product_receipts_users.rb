class CreateProductReceiptsUsers < ActiveRecord::Migration
  def self.up
    create_table :product_receipts_users do |t|
      t.integer :user_id
      t.integer :products_receipt_id

      t.timestamps
    end
  end

  def self.down
    drop_table :product_receipts_users
  end
end
