class CreateStoreaccounts < ActiveRecord::Migration
  def self.up
    create_table :storeaccounts do |t|
      t.integer :user_id
      t.string :ip_address
      t.string :first_name
      t.string :last_name
      t.string :card_type
      t.date :card_expires_on

      t.timestamps
    end
  end

  def self.down
    drop_table :storeaccounts
  end
end
