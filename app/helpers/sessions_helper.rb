module SessionsHelper
    
    # Creates a session for a user sign in. Notice: if remember me is checked, cookie = permanent
    def sign_in(user)
        if params[:remember_me]
            cookies.permanent.signed[:auth_token] = [user.id, user.password_salt]
            self.current_user = user
        else
            cookies.signed[:auth_token] = [user.id, user.password_salt]
            self.current_user = user
        end
    end
    
    # Set current User
    def current_user=(user)
        @current_user = user
    end
    
    # Define current user
    def current_user
        @current_user ||= user_from_auth_token
    end
    
    # Test for to see if the user is signed in
    def signed_in?
        !current_user.nil?
    end
    
    # Destroy user session
    def sign_out
        cookies.delete(:auth_token)
        @current_user = nil
    end
    
    # Use deny_access method to restrict to signed in user
    def authenticate
        deny_access unless signed_in?
    end
    
    # Restrict given item to a signed in user
    def deny_access
        store_location
        redirect_to signin_path, :notice => "Please sign in to view this page"
    end
    
    # Test to see if current_user is a given user
    def current_user?(user)
        user == current_user
    end
    
    def redirect_back_or(default)
        redirect_to(session[:return_to] || default )
        clear_return_to
    end

    private
    
    def user_from_auth_token
        User.authenticate_with_salt(*auth_token)
    end

    def auth_token
        cookies.signed[:auth_token] || [nil, nil]
    end

    def store_location
        session[:return_to] = request.fullpath
    end

    def clear_return_to
        session[:return_to] = nil
    end
end
