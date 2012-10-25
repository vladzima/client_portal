class UsersController < ApplicationController
    before_filter :require_login
    before_filter :internal_only, :only => [:show, :edit, :update, :create, :update, :destroy ]
    before_filter :internal_admin_only, :only => [:new, :edit, :create, :destroy]

	def index
        if current_user.internal == false
            @user = User.find(current_user.id)
            render "show"
        else
            if params[:customer_id]
                @users = User.where("customer_id = ?", params[:customer_id])
            else
                @users = User.all
            end
		end
    end

    def show
        @user = User.find(params[:id])
    end

    # GET /users/new
    # GET /users/new.json
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

    def create
        #logger.debug(params)
        @user = User.new(params[:user])
        if @user.save
            redirect_to @user, notice: 'User was successfully created.'
        else
            render action: "new"
        end
    end


    def update
        #logger.debug(params)
        @user = User.find(params[:id])

        respond_to do |format|
            if @user.update_attributes(params[:user])
                format.html { redirect_to @user, notice: 'User was successfully updated.' }
                format.json { head :no_content }
            else
                format.html { render action: "edit" }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path
    end
end
