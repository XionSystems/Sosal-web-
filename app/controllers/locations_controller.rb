class LocationsController < ApplicationController

    def create
        @location = current_user.locations.build(params[:location])
        if @location.save
            redirect_to root_path
        else
            render 'pages/home'
        end
    end
    
    def update
    end
    
    def destroy
    end
    
end
