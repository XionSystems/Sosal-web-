class MessagesController < ApplicationController
    include MessagesHelper
    before_filter :authenticate
    
    def new
        @title = "New Message"
        @profile = Profile.where("user_id =?", current_user.id)
        @new = Message.new 
        
    end
    
    def create
        @new = current_user.messages.build(params[:message])
        if @new.subject.nil?
            @new.subject = "No Subject"
        end
        if !@new.content.empty?
            @user = User.where("name like ?", "%#{params[:q]}%") 
            @tokens = @user.map(&:id).to_json.to_s
            @new.recip_id = eval(@tokens).last
            @new.save
            flash[:success] = "Sent"
            redirect_to messages_path(current_user)
        else
            @message_items = [ ]
            render 'pages/home'
        end
    end
    
    def show 
        @title = "Messages"
        @message = Message.find(params[:id])
        @response = Response.new
        @message_items = current_user.message_feed.all
        @profile = Profile.where("user_id =?", current_user.id)
    end
    
    def index
        @title = "Messages"
        @message_items = current_user.message_feed.paginate(:page => params[:page])
        @profile = Profile.where("user_id =?", current_user.id)
    end
    
    def destroy
    end
    
    def user_messages
        search_users
    end
end
