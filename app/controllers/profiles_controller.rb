class ProfilesController < ApplicationController
    before_filter :authenticate
    
    def new
        @title = "Add Profile Pic"
        @avatar = Profile.new
    end
    
    def create
        @avatar = current_user.profiles.build(params[:profile])
        if @avatar.save
            redirect_to current_user
        else
            render :new
        end
    end
    
    def edit
    end
    
    def update
    end
    
    def destroy
    end
    
end
