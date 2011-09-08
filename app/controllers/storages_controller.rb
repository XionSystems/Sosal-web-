class StoragesController < ApplicationController
    
    def new
    end
    
    def create
    end
    
    def edit
    end
    
    def update
    end
    
    def show
        @title = "#{current_user.username}'s Storedge"
        @storage = current_user.storages
        @search = @storage.find(:all).map(&:name).to_json
    end
end
