class BookmarksController < ApplicationController
    before_filter :authenticate
    before_filter :authorized_user, :only => :destroy
    
    def create
        @bookmarks = current_user.bookmarks.build(params[:bookmark])
        if !@bookmarks.url.empty?
            if @bookmarks.web_name.nil?
                @bookmarks.web_name = "#{@bookmarks.url}"
            end
            @bookmarks.save
            redirect_to current_user
        else
            @favs = [ ]
            render 'pages/home'
        end 
    end
    
    def update
        @user = User.find(params[:id])
        @bookmarks = @user.bookmarks.find_by_id(params[:id])
        if @bookmarks.update_attributes
            redirect_to @user
        else
            render @user
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
