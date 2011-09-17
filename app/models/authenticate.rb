# SQL Reference Sheet
# t.integer  "user_id"
# t.string   "provider"
# t.string   "uid"
#
class Authenticate < ActiveRecord::Base
    belongs_to :user
end
