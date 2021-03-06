class UsersController < ApplicationController
    before_filter :require_login
    before_filter :internal_only, :only => [:show, :create, :destroy ]
    before_filter :internal_admin_only, :only => [:new, :create, :destroy]

	def index
        if current_user.internal == false
            #a non internal user can only see their own profile
            @user = User.find(current_user.id)
            render "show"
        else
            if params[:customer_id]
                @users = User.where("customer_id = ?", params[:customer_id])
            else
                @users = User.paginate(:page => params[:page], :per_page => 20)
            end
		end
    end

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
        if params[:customer_id]
            @customer = Customer.find(params[:customer_id])
            @user.customer_id = @customer.id
        end
    end

    def edit
        @user = User.find(params[:id])
    end
    
    def edit_profile
        @user = User.find(current_user.id)
        #if current_user.admin == true
        #    render "edit"
        #else
        #    render "edit_profile"
        #end
    end

    def create
        #logger.debug(params)
        @user = User.new(params[:user])
        if @user.save
            @user.deliver_password_reset_instructions!  
            flash[:notice] = "Instructions to set your password have been emailed to #{@user.email}." 
            redirect_to @user, notice: 'User was successfully created.'
        else
            render action: "new"
        end
    end


    def update
        #logger.debug(params)
        @user = User.find(params[:id])

        if @user.update_attributes(params[:user])
            redirect_to @user, notice: 'User was successfully updated.'
        else
            render action: "edit" 
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path
    end
end
