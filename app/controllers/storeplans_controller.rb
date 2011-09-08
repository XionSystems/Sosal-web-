class StoreplansController < ApplicationController
    before_filter :authenticate
    
    def new
        @title = "Upgrade Your Account"
        @storeplan = Storeplan.new
        @free = Storeplan.new
    end
    
    def create
        @storeplan = Storeplan.new(params[:storeplan])
        @storeplan.user_id = current_user.id
        if @storeplan.save
            if @storeplan.total_price == 0
                redirect_to storage_path(current_user)
            else
                redirect_to new_storeaccount_path
            end
        else
            render :new
        end
    end
    
    def edit
    end
    
    def upgrade
    end
    
    def destroy
    end
end
