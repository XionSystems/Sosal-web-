# SQL Reference Sheet
# t.integer  "user_id"
# t.string   "name"
# t.datetime "created_at"
# t.datetime "updated_at"
# t.string   "file_file_name"
# t.string   "file_content_type"
# t.integer  "file_file_size"
# t.datetime "file_updated_at"
#
class Storage < ActiveRecord::Base
    attr_accessible :name, :file, :file_attributes
    belongs_to :user
    
    has_attached_file :file
end
