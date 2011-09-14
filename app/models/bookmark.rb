# SQL Refernence Sheet
# t.integer  "user_id"
# t.string   "web_name"
# t.string   "url"
#
class Bookmark < ActiveRecord::Base
    attr_accessible :web_name, :url, :description
    belongs_to :user
    
     default_scope :order => 'bookmarks.created_at DESC'
     
     bookmark_regex = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix
     
     validates :user_id, :presence => true
     validates :web_name, :length => {:maximum => 25}
     validates :url, :presence => true,
                     :format => {:with => bookmark_regex}
     validates :description, :length => {:maximum => 50}
     
     def self.search_bookmark(search_bookmark)
         if search_bookmark
            find(:all, :conditions => ['web_name || url LIKE ?', "%#{search}%"])
         else
            find(:all)
         end
    end
end
