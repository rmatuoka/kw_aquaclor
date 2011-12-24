class AddActiveToReseller < ActiveRecord::Migration
  def self.up
    add_column :resellers, :active, :boolean
  end

  def self.down
    remove_column :resellers, :active
  end
end
