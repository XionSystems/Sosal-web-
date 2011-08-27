class StatusesController < ApplicationController
    before_filter :authenticate, :only => [:create, :destroy]
    before_filter :authorized_user, :only => :destroy

    def create
      @status = current_user.statuses.build(params[:status])
      if !@status.content.empty?
        @status.save
        flash[:success] = "Posted"
        redirect_to current_user
      else
        @feed_items = [ ]
        render 'pages/home'
      end
    end

    def destroy
      @status.destroy
      redirect_back_or root_path
    end

    private

    def authorized_user
      @status = current_user.statuses.find_by_id(params[:id])
      redirect_to root_path if @status.nil?
    end
end
