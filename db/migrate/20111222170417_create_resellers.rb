class CreateResellers < ActiveRecord::Migration
  def self.up
    create_table :resellers do |t|
      t.string :name
      t.string :address
      t.string :number
      t.string :neibourhood
      t.string :city
      t.string :state
      t.string :phone
      t.string :email
      t.string :cnpj

      t.timestamps
    end
  end

  def self.down
    drop_table :resellers
  end
end
