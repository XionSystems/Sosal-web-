class AddStatsToLocation < ActiveRecord::Migration
  def self.up
      add_column :locations, :latitude, :float 
      add_column :locations, :longitude, :float 
      add_column :locations, :gmaps, :boolean 
  end

  def self.down
      remove_column :locations, :latitude 
      remove_column :locations, :longitude
      remove_column :locations, :gmaps
  end
end
