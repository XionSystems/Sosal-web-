class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.integer :user_id
      t.integer :recip_id
      t.string :subject
      t.string :content

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
