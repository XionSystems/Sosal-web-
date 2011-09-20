class AuthenticatesController < ApplicationController
    
   def create
      auth = request.env["omniauth.auth"]
      current_user.authenticates.find_or_create_by_provider_and_uid(auth['provider'], auth['uid'])
      flash[:notice] = "Authentication successful."
      redirect_to root_path
    end

    def destroy
      @authentications = Authenticate.find(params[:id])
      @authentications.destroy
      flash[:notice] = "Successfully destroyed authentication."
      redirect_to root_path
    end
end
