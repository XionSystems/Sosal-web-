class UsersController < ApplicationController
    before_filter :authenticate, :only => [:destroy, :portfolio, :show]
    before_filter :correct_user, :only => [:edit, :update]
    before_filter :admin_user, :only => [:destroy]
    before_filter :search_user
    
    def new
        @title = "Sign Up"
        @user = User.new
    end
    
    def create
        @user = User.new(params[:user])
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
        @bookmark = @user.bookmarks.find_by_id(params[:id])
        @bookmarks = Bookmark.new
        @json = @user.personal_map.to_gmaps4rails
        @favs = @user.bookmark_feed.paginate(:page => params[:page], :per_page => 5)
        @feed_items = @user.personal_feed.paginate(:page => params[:page])
    end
    
    def index
        @title = "Everybody"
        @users = User.search(params[:search])
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
     
     private
     
     def correct_user
       @user = User.find(params[:id])
       redirect_to(root_path) unless current_user?(@user)
     end

     def admin_user
       @user= User.find(params[:id])          
       redirect_to(root_path) if !current_user.admin? || current_user?(@user)
     end
end
