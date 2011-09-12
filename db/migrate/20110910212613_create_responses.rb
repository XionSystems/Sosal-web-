class CreateResponses < ActiveRecord::Migration
  def self.up
    create_table :responses do |t|
      t.integer :message_id
      t.string :content

      t.timestamps
    end
  end

  def self.down
    drop_table :responses
  end
end
