class StoreaccountsController < ApplicationController
    before_filter :authenticate 
    
    def new
        @title = "Account"
        @storeaccount = Storeaccount.new
    end
    
    def create
      @plan = Storeplan.where("user_id = ?", current_user.id)
      @storeaccount = @plan.build_storeaccount(params[:storeaccount])
      if @storeaccount.save
        if @storeaccount.purchase
          render :action => "success"
        else
          render :action => "failure"
        end
      else
        render :action => 'new'
      end
    end
    
    def edit
    end
    
    def update
    end
end
