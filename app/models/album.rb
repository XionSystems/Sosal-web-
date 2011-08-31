# SQL Reference Sheet
# t.integer  "user_id"
# t.string   "name"
# t.string   "photo_file_name"
# t.string   "photo_content_type"
# t.integer  "photo_file_size"
# t.datetime "photo_updated_at"
#
class Album < ActiveRecord::Base
    attr_accessor :crop_x, :crop_y, :crop_h, :crop_w
    attr_accessible :name, :photo, :photo_attributes, :crop_x, :crop_y, :crop_h, :crop_w
    has_many :photos
    belongs_to :user
    
    accepts_nested_attributes_for :photos,
        :reject_if => proc { |attributes| attributes.blank? }, 
        :allow_destroy => true
    
    has_attached_file :photo, :styles => {:large => "350x350-adaptive-resize",
                                          :standard => "140x140#"},
                                          :processors => [:cropper]
    
    validates :user_id, :presence => true
    
    validates :name, :presence => true,
                     :length => { :maximum => 36}
                     
    
    after_update :reprocess_photo, :if => :cropping?

    def cropping?
        !crop_x.blank? && !crop_y.blank? && !crop_h.blank? && !crop_w.blank?
    end

    def photo_geometry(style = :original)
        @geometry ||= {}
        @geometry[style] ||= Paperclip::Geometry.from_file(photo.path(style))
       end

    private

    def reprocess_photo
       photo.reprocess!
    end
end
