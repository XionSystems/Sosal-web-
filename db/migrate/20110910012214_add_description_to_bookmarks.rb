class AddDescriptionToBookmarks < ActiveRecord::Migration
  def self.up
    add_column :bookmarks, :description, :string
  end

  def self.down
    remove_column :bookmarks, :description
  end
end
