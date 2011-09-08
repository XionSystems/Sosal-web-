class AddPriceToStoreplans < ActiveRecord::Migration
  def self.up
    add_column :storeplans, :total_price, :integer
  end

  def self.down
    remove_column :storeplans, :total_price
  end
end
