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
    
    scope :from_users_follow_locate, lambda { |user| follow_locate(user) }


    private

    def self.follow_locate(user)
        following_ids = %(SELECT followed_id FROM relationships WHERE follower_id = :user_id)
        where("user_id IN (#{following_ids}) OR user_id = :user_id",
        { :user_id => user})
    end
end
