class AlbumsController < ApplicationController
    before_filter :authenticate
    
    def create
        @album = current_user.albums.build(params[:album])
        if @album.save
            render :action => :crop
        else
            render :new
        end
    end
    
    def update
        @album = Album.find(params[:id])
        if @album.update_attributes(params[:album])
            flash[:success] = "Cropped Photo"
            redirect_to portfolio_path(current_user)
        else
            render :action => 'crop'
        end
    end
        
    
    def destroy
    end
end
