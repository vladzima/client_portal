class UserSessionsController < ApplicationController
    layout "login"

    def new
        if current_user
            redirect_to customers_path
        else
            @user_session = UserSession.new
        end
    end

    def create
        @user_session = UserSession.new(params[:user_session])
        if @user_session.save
            logger.debug()
            flash[:notice] =  'Thank you for using Best Neon Web portal'
            redirect_to customers_path
        else
            flash[:notice] = "no go today"
            render action: "new"
        end
    end

    def destroy
        @user_session = UserSession.find
        @user_session.destroy
        redirect_to(:login, :notice => "You have successfully logged out!")
    end

end