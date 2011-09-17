# SQL Reference Sheet
# t.integer  "user_id"
# t.string   "avatar_file_name"
# t.string   "avatar_content_type"
# t.integer  "avatar_file_size"
# t.datetime "avatar_updated_at"
#
class Profile < ActiveRecord::Base
    attr_accessible :avatar, :avatar_attributes
    belongs_to :user
    
    has_attached_file :avatar, :styles => {:large => "180x200#",
                                          :thumb => "52x52#"}
end
