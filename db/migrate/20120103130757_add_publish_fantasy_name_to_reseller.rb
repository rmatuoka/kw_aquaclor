class AddPublishFantasyNameToReseller < ActiveRecord::Migration
  def self.up
    add_column :resellers, :fantasy_name, :string
    add_column :resellers, :publish, :boolean
  end

  def self.down
    remove_column :resellers, :publish
    remove_column :resellers, :fantasy_name
  end
end
