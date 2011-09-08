class CreateStoreplans < ActiveRecord::Migration
  def self.up
    create_table :storeplans do |t|
      t.integer :user_id
      t.integer :plan
      t.string :plan_title

      t.timestamps
    end
  end

  def self.down
    drop_table :storeplans
  end
end
