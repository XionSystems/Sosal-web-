class CreateAbouts < ActiveRecord::Migration
  def self.up
    create_table :abouts do |t|
      t.integer :user_id
      t.string :type, :default => ""
      t.string :moto, :default => ""
      t.string :occupation, :default => ""
      t.string :home_town, :default => ""
      t.string :current_town, :default => ""
      t.string :gender, :default => ""
      t.string :relationship, :default => ""

      t.timestamps
    end
  end

  def self.down
    drop_table :abouts
  end
end
