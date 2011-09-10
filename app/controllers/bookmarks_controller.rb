class BookmarksController < ApplicationController
    before_filter :authenticate
    before_filter :authorized_user, :only => :destroy
    
    def create
        @bookmarks = current_user.bookmarks.build(params[:bookmark])
        if !@bookmarks.url.empty?
            @bookmarks.save
            redirect_to current_user
        else
            @favs = [ ]
            render 'pages/home'
        end 
    end
    
    def destroy
        @bookmarks.destroy
        redirect_to current_user
    end

    private

    def authorized_user
        @bookmarks = current_user.bookmarks.find_by_id(params[:id])
        redirect_to current_user if @bookmarks.nil?
    end
end
