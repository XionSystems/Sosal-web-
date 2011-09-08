class BookmarksController < ApplicationController
    before_filter :authenticate
    
    def create
        @bookmarks = current_user.bookmarks.build(params[:bookmark])
        if !@bookmarks.content.empty?
            @bookmarks.save
            respond_to do |format|
                format.html
                format.js
            end
        else
            @feed_items = [ ]
            render 'pages/home'
          end 
    end
    
    def destroy
    end
    
end
