class ResponsesController < ApplicationController
    before_filter :authenticate
    
    def create
        @response = Response.new(params[:response])
        @response.user_id = current_user.id
        if @response.save
            flash[:notice] = "Message Sent!"
            redirect_to messages_path(current_user)
        else
            flash[:alarm] = "Message could not be sent"
            redirect_to root_path
        end
    end
    
    def destroy
    end
end
