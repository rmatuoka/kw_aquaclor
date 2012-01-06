class AddInternalCodeToReseller < ActiveRecord::Migration
  def self.up
    add_column :resellers, :internal_code, :string
  end

  def self.down
    remove_column :resellers, :internal_code
  end
end
