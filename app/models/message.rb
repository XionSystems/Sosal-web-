# SQL Reference Sheet
# t.integer  "user_id"
# t.integer  "recip_id"
# t.string   "subject"
# t.string   "content"
#
class Message < ActiveRecord::Base
    # Sender token used to search for recip_id 
    attr_reader :sender_tokens
    attr_accessible :subject, :content
    belongs_to :user
    has_many :responses
    
    validates  :user_id, :presence => true
    validates :recip_id, :presence => true
    validates :subject, :length => { :maximum => 50 }
    validates :content, :length => { :maximum => 140 }
    
    default_scope :order => 'messages.created_at DESC'
    
    scope :from_users_recip_id, lambda {|user| recip_id(user)}
    
    def sender_tokens=(id)
         user_id = id.split(",")
    end
    
    def self.search_messages(search_messages)
        if search_messages
          find(:all, :conditions => ['subject LIKE ?', "%#{search}%"])
        else
          find(:all)
        end
    end 
    
    private
    
    def self.recip_id(user)
         where("recip_id = :user_id", {:user_id => user})
    end
end
