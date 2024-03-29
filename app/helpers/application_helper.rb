module ApplicationHelper
    
    # Sets the title for the web site- use @title in controllers
    def title
        base_title = "Sosal"
        if @title.nil?
            "#{base_title} - The Web, Simplified"
        else
            "#{@title} @ #{base_title}"
        end
    end
    
    # Finds the current user's browser. Used for noscript
    def client_browser_name
        user_agent = request.env['HTTP_USER_AGENT'].downcase
        if user_agent =~ /msie/i
            "Microsoft"
        elsif user_agent =~ /applewebkit/i
            "Apple or Google"
        elsif user_agent =~ /Chrome/i
            "Google"
        elsif user_agent =~ /Mozilla/i
            "Mozilla"
        else
            "your browser"
        end
    end
    
    # The site's logo
    def logo
        logo = image_tag("Sosal_logo.png", :alt => "Sosal")
    end
    
    def home_photo
        home_photo = image_tag("home_logo.png", :alt => "Play", :id => "play_button" )
    end
    
    # Photo for those without one
    def default_photo
        default_photo = image_tag("default-avatar.png", :alt => "Photo", :size => "180x200")
    end
    
    def default_thumb
        default_thumb = image_tag("default-avatar.png", :alt => "Photo", :size => "52x52")
    end
    
    def search 
        User.find(:all).map(&:name).to_json
    end
    
    def search_user
        @search = search
    end
    
    def site_stats
        messages = current_user.message_feed.count
        followers = current_user.followers.count
        site_stats = messages + followers
    end
    
    def pro_pic
        @pro_pic = Profile.where("user_id = ?", current_user.id)
    end
end
