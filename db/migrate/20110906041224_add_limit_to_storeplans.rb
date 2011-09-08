class AddLimitToStoreplans < ActiveRecord::Migration
  def self.up
    add_column :storeplans, :limit, :integer
  end

  def self.down
    remove_column :storeplans, :limit
  end
end
