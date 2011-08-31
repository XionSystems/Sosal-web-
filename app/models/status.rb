# SQL Reference Sheet
# t.integer  "user_id"
# t.string   "content"
#
class Status < ActiveRecord::Base
    attr_accessible :content
    belongs_to :user
    
    validates :content, :presence => true,
                        :length => { :maximum => 400}
                        
    validates :user_id, :presence => true
    
    default_scope :order => 'statuses.created_at DESC'

    # Return Statuses from the users followed by the given user
    scope :from_users_followed_by, lambda { |user| followed_by(user) }


    private

    def self.followed_by(user)
        following_ids = %(SELECT followed_id FROM relationships WHERE follower_id = :user_id)
        where("user_id IN (#{following_ids}) OR user_id = :user_id",
        { :user_id => user})
    end
end
