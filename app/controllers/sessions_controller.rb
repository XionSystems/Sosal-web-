class SessionsController < ApplicationController
    def new
        @title = "Sign In"
    end

    def create
        user = User.authenticate(params[:session][:email],
                                 params[:session][:password])
        if user.nil?
            flash[:error] = "Incorrect email/password combination. Please try again."
            @title = "Sign in"
            render :new
        else
            sign_in user
            redirect_to root_url
        end
    end

    def destroy
        sign_out
        redirect_to goodby_url
    end
end
