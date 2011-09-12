# SQL Reference Sheet
# t.integer  "message_id"
# t.string   "content"
#
class Response < ActiveRecord::Base
    attr_accessible :content
    belongs_to :message
end
