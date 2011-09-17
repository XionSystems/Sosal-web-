class AuthenticatesController < ApplicationController
    
   def create
      auth = request.env["rack.auth"]
      current_user.authenticates.find_or_create_by_provider_and_uid(auth['provider'], auth['uid'])
      flash[:notice] = "Authentication successful."
      redirect_to root_path
    end

    def destroy
      @authentication = current_user.authenticates.find(params[:id])
      @authentication.destroy
      flash[:notice] = "Successfully destroyed authentication."
      redirect_to root_url
    end
end
