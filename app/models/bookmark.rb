# SQL Refernence Sheet
# t.integer  "user_id"
# t.string   "web_name"
# t.string   "url"
#
class Bookmark < ActiveRecord::Base
    attr_accessible :web_name, :url
    belongs_to :user
    
     default_scope :order => 'bookmarks.created_at DESC'
     
     validates :user_id, :presence => true
     validates :web_name, :presence => true
     validates :url, :presence => true
     
end
