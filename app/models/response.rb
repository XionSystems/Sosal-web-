# SQL Reference Sheet
# t.integer  "message_id"
# t.integer  "user_id"
# t.string   "content"
#
class Response < ActiveRecord::Base
    attr_accessible :content
    belongs_to :message
    
    validates :message_id, :presence => true
    validates :user_id, :presence => true
    
    
end
