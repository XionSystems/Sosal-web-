# SQL Reference Sheet
# t.integer  "user_id"
# t.string   "type",         :default => ""
# t.string   "moto",         :default => ""
# t.string   "occupation",   :default => ""
# t.string   "home_town",    :default => ""
# t.string   "current_town", :default => ""
# t.string   "gender",       :default => ""
# t.string   "relationship", :default => ""
#
class About < ActiveRecord::Base
    # NOTE: For about_user
    attr_accessible :type, :moto, :occupation, :home_town, :current_town, :gender, :relationship
    belongs_to :user
    
    validates :user_id, :presence => true
    
end
