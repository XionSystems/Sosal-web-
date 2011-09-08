class AddNamesToStoreaccounts < ActiveRecord::Migration
  def self.up
    add_column :storeaccounts, :username, :string
    add_column :storeaccounts, :name, :string
  end

  def self.down
    remove_column :storeaccounts, :name
    remove_column :storeaccounts, :username
  end
end
