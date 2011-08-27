# SQL Reference Sheet
# t.integer  "album_id"
# t.string   "name"
# t.datetime "created_at"
# t.datetime "updated_at"
# t.string   "picture_file_name"
# t.string   "picture_content_type"
# t.integer  "picture_file_size"
# t.datetime "picture_updated_at"
#
class Photo < ActiveRecord::Base
    attr_accessible :name, :picture, :picture_attributes
    belongs_to :albums
    
    has_attached_file :pictures, :styles => {:large => "350x350-adaptive-resize",
                                             :standard => "140x140#"}
end
