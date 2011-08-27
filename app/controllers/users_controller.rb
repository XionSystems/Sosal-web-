class UsersController < ApplicationController
    before_filter :authenticate, :only => [:destroy, :portfolio, :show]
    
    def new
        @title = "Sign Up"
        @user = User.new
    end
    
    def create
        @user = User.new(params[:user])
        @user.username = params[:user][:username]
        @user.name = params[:user][:name]
        @user.email = params[:user][:email]
        @user.password = params[:user][:password]
        @user.password_confirmation = params[:user][:password_confirmation]
        @user.birthday = params[:user][:birthday]   
        if @user.save
            sign_in @user
            redirect_to root_path
        else
            render :new
        end
    end
    
    def show
        @user = User.find(params[:id])
        @title = "#{@user.username}'s Profile"
        @pictures = @user.albums
        @status = Status.new
        @feed_items = current_user.personal_feed.paginate(:page => params[:page])
    end
    
    def index
    end
    
    def edit
       @user = User.find(params[:id])
       @title = "Edit Account"
    end

    def update
      @user = User.find(params[:id])
      if @user.update_attributes(params[:user])
        flash[:success] = "Profile Updated!"
        redirect_to @user
      else
        @title = "Edit Account"
        render :edit
      end
    end
    
    def destroy
        user= User.find(params[:id])
        if current_user?(user)
            flash[:alert] = "What kind of admin are you?"
        else
            user.destroy
            flash[:notice] = "User Deleted"
        end
        redirect_to users_path
    end
    
     def portfolio
         @user = User.find(params[:id])
         @title = "#{@user.username}'s Portfolio"
         @album = Album.new
         @portfolio = @user.albums.paginate(:page => params[:page])
     end
     
     def following
         @title = "People You're Following"
         @user = User.find(params[:id])
         @users = @user.following.all
         render 'show_follow'
     end

     def followers
         @title = "People Following You"
         @user = User.find(params[:id])
         @users = @user.followers.all
         render 'show_follow'
     end
end
