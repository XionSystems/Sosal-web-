class PhotosController < ApplicationController
    before_filter :authenticate
    
    def new
        @title = "Add Photos"
        @album = Album.find(params[:album_id])
        @photos = @album.photos.new
    end
    
    def create
        @album = Album.find(params[:album_id])
        @photos = @album.photos.build(params[:photo])
        if @photos.name.empty?
            @photos.name = "No Name"
        end
        if @photos.save
            render :action => "crop"
        else
            render :new
        end
    end
    
    def show
       @picture = Photo.find(params[:id])
       @title = "Photos"
    end
    
    def index
        @album = Album.find(params[:album_id])
        @photos = @album.photos.paginate(:page => params[:page], :per_page => 24)
        @picture = @album.photos.new
        @title = "#{@album.name}"
    end
    
    def update
        @album = Album.find(params[:album_id])
        @photos = @album.photos.find(params[:id])
        if @photos.update_attributes(params[:picture])
            flash[:success] = "Cropped Photo"
            redirect_to album_photos_path(@album)
        else
            render :action => 'crop'
        end
    end
    
    def destroy
    end

end
