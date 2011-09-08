class PagesController < ApplicationController

    def home
        if signed_in?
            @title = "#{current_user.username}'s Front Page"
            @json = current_user.locations.all.to_gmaps4rails
            @feed_items = current_user.overall_feed.paginate(:page => params[:page])
            @search = search
            @location = Location.new
        end
    end
    
    def goodby
    end
    
    def about
        @title = "About Us"
    end
    
    def help
        @title = "Help, Q&A, and other wikis"
    end
    
    def terms
        @title = "Terms"
    end
    
    def privacy
        @title = "Privacy"
    end
    
    def resources
        @title = "Resources"
    end
    
    def welcome
        @title = "Getting Started"
    end
end
