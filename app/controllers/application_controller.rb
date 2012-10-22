class ApplicationController < ActionController::Base
    protect_from_forgery
    
    #include ApplicationHelper
    
    #filter_parameter_logging :password, :password_confirmation
    helper_method :current_user_session, :current_user
  
    private
    
    def current_user_session
        return @current_user_session if defined?(@current_user_session)
        @current_user_session = UserSession.find
    end
    
    def current_user
        return @current_user if defined?(@current_user)
        @current_user = current_user_session && current_user_session.user
    end
    
    def require_login
        unless current_user
            #store_location
            flash[:notice] = "You must be logged in to access this page"
            redirect_to new_user_session_path
            return false
        end
    end

    def require_no_login
        if current_user
            store_location
            flash[:notice] = "You must be logged out to access this page"
            redirect_to user_path
            return false
        end
    end

    #def store_location
    #    session[:return_to] = request.request_uri
    #end

    def redirect_back_or_default(default)
        #redirect_to(session[:return_to] || default)
        redirect_to default
        session[:return_to] = nil
    end
    
    def internal_only
        if current_user.internal == true
            return true
        else
            redirect_to users_path
            return false
        end
    end

end