class PagesController < ApplicationController
    
    def home
        if signed_in?
            @title = "#{current_user.username}'s Front Page"
        end
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
