class AddAccountToStoreaccounts < ActiveRecord::Migration
  def self.up
    add_column :storeaccounts, :storeplan_id, :integer
  end

  def self.down
    remove_column :storeaccounts, :storeplan_id
  end
end
