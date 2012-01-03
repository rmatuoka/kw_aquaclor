class AddAcceptToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :accept, :boolean
  end

  def self.down
    remove_column :users, :accept
  end
end
