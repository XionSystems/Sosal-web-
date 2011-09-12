class PasswordResetsController < ApplicationController

    def create
      user = User.find_by_email(params[:email])
      user.send_password_reset if user
      redirect_to root_path, :notice => "Email sent with password reset instructions."
    end

    def edit
      @user = User.find_by_password_rem_token!(params[:id])
    end

    def update
      @user = User.find_by_password_rem_token!(params[:id])
      if @user.password_rem_sent_at < 2.hours.ago
        redirect_to new_password_rem_path, :alert => "Sorry, password reset has expired."
      elsif @user.update_attributes(params[:user])
        redirect_to root_path, :notice => "Password has been reset!"
      else
        render :edit
      end
    end
end
