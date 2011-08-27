class AboutsController < ApplicationController
    before_filter :authenticate 
    
    def new
        @title = "Edit Your Profile"
        @user = User.find(params[:user_id])
        @about = @user.abouts.new
        @gender = %w(Male Female)
        @relationship = %w(Single Taken Married CivilUnion)
        @type = %w(Rational Expressor Social Leader)
    end
    
    def create
        @user = User.find(params[:user_id]) 
        @about = @user.abouts.build(params[:about])
        if @about.save
            flash[:notice] = "Profile Saved"
            redirect_to @user
        else
            flash[:alert] = "Error. Profile could not be saved"
            render :new
        end
    end
    
    def edit
        @title = "Edit Your Profile"
        @user = User.find(params[:user_id]) 
        @about = @user.abouts.find(params[:id])
        @gender = %w(Male Female)
        @relationship = %w(Single Taken Married CivilUnion)
        @type = %w(Rational Expressor Social Leader)
    end
    
    def update
      @user = User.find(params[:user_id]) 
      @about = @user.abouts.find(params[:id])
      if @about.update_attributes(params[:about])
        flash[:success] = "Profile Updated!"
        redirect_to current_user
      else
        @title = "Edit Your Profile"
        render 'edit'
      end
    end
    
    def destroy
    end
end
