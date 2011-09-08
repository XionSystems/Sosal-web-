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
    
    def storage_info
    end
    
    def about
    end
    
    def help
    end
    
    def terms
    end
    
    def privacy
    end
    
    def resources
    end
    
    def welcome
        @title = "Getting Started"
    end
end
