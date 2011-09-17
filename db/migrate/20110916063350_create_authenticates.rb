class CreateAuthenticates < ActiveRecord::Migration
  def self.up
    create_table :authenticates do |t|
        t.integer :user_id
        t.string  :provider
        t.string  :uid

      t.timestamps
    end
  end

  def self.down
    drop_table :authenticates
  end
end
