# SQL Reference Sheet
# t.string   "username"
# t.string   "name"
# t.string   "email"
# t.boolean  "admin"
# t.string   "password_rem_token"
# t.string   "password_hash"
# t.string   "password_salt"
# t.string   "birthday"
#
class User < ActiveRecord::Base
    attr_accessor :password
    attr_protected :admin
    has_one :profile, :dependent => :destroy
    has_many :abouts, :dependent => :destroy
    has_many :albums, :dependent => :destroy
    has_many :statuses, :dependent => :destroy
    has_many :relationships, :foreign_key => "follower_id", :dependent => :destroy
    has_many :reverse_relationships, :foreign_key => "followed_id", :class_name => "Relationship",
                                     :dependent => :destroy
    has_many :following, :through => :relationships, :source => :followed
    has_many :followers, :through => :reverse_relationships, :source => :follower
                    
    validates :username, :presence => true
    validates :name, :presence => true
    validates :email, :presence => true
    validates :password, :presence => true, 
                         :confirmation => true
    validates :birthday, :presence => true
    
    before_save :encrypt_password

    def self.authenticate(email, password)
        user = find_by_email(email)
        if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
            user
        else
            nil
        end
    end
    
    def self.authenticate_with_salt(id, cookie_salt)
        user = find_by_id(id)
        (user && user.password_salt == cookie_salt) ? user : nil
    end

    def encrypt_password
        if password.present?
            self.password_salt = BCrypt::Engine.generate_salt
            self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
        end
    end
    
    def overall_feed
      Status.from_users_followed_by(self)
    end
    
    def personal_feed
      Status.where("user_id = ?", id)
    end

    def following?(followed)
      relationships.find_by_followed_id(followed)
    end

    def follow!(followed)
       relationships.create!(:followed_id => followed.id)
    end

    def unfollow!(followed)
       relationships.find_by_followed_id(followed).destroy
    end
    
    def self.search(search)
      if search
        find(:all, :conditions => ['username || name LIKE ?', "%#{search}%"])
      else
        find(:all)
      end
    end
end
