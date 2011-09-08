# SQL Reference Sheet
# t.integer  "user_id"
# t.string   "address"
# t.float    "latitude"
# t.float    "longitude"
# t.boolean  "gmaps"
#
class Location < ActiveRecord::Base
    acts_as_gmappable
    attr_accessible :address, :latitude, :longitude, :gmaps
    belongs_to :user
    
    validates :user_id, :presence => true
    
    validates :address, :presence => true
    
    def gmaps4rails_address
        address 
    end
    
end
