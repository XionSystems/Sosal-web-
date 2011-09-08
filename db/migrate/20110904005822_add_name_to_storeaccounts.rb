class AddNameToStoreaccounts < ActiveRecord::Migration
  def self.up
    add_column :storeaccounts, :first_name, :string
    add_column :storeaccounts, :last_name, :string
  end

  def self.down
    remove_column :storeaccounts, :last_name
    remove_column :storeaccounts, :first_name
  end
end
