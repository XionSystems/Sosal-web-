module MessagesHelper
    def search_users
          @user = User.where("name like ?", "%#{params[:q]}%")
          respond_to do |format|
              format.html
              format.json { render :json => @user.map(&:attributes)}
          end
    end
end
