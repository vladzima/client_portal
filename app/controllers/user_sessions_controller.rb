class AccountSessionsController < ApplicationController

    def new
        if current_user
            if current_user.internal == true
                redirect_to customers_path
            elsif current_account.isAdmin == true
                redirect_to customer_path(current_user.customer_id)
            end
        else
            @user_session = UserSession.new
        end
    end

    def create
        #@user_session = UserSession.new(params[:user_session])
        @user.save_without_session_maintenance  #-> send email with confirmation link that functions like password reset
        if @user_session.save
            redirect_to users_path, :notice => 'Thank you for using Padseeker'
        else
            render action: "new"
        end
    end

    def destroy
        @user_session = UserSession.find
        @user_session.destroy
        redirect_to(:login, :notice => "You have successfully logged out!")
    end

end