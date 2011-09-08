class CreateOrderTransactions < ActiveRecord::Migration
  def self.up
    create_table :order_transactions do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :order_transactions
  end
end
