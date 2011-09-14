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
    attr_accessor :crop_x, :crop_y, :crop_h, :crop_w
    attr_accessible :name, :picture, :picture_attributes, :crop_x, :crop_y, :crop_h, :crop_w
    belongs_to :albums
    
    has_attached_file :picture, :styles => {:large => "350x350-adaptive-resize",
                                             :standard => "140x140#"}

    validates :album_id, :presence => true

    validates :name, :presence => true,
                     :length => { :maximum => 36}


    after_update :reprocess_picture, :if => :cropping?

    def cropping?
        !crop_x.blank? && !crop_y.blank? && !crop_h.blank? && !crop_w.blank?
    end

    def photo_geometry(style = :original)
        @geometry ||= {}
        @geometry[style] ||= Paperclip::Geometry.from_file(picture.path(style))
    end

    private

    def reprocess_picture
        picture.reprocess!
    end
end
