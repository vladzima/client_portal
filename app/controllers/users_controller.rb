class UsersController < ApplicationController

	def index
		if params[:customer_id]
			@users = User.where("customer_id = ?", params[:customer_id])
            #.paginate(:page => params[:page], :per_page => 20)
		else
			@users = User.all
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
        @user = User.new(params[:user])
        if @user.customer_id.nil? == true
            @user.internal = true
        else
            @user.internal = false
        end

        respond_to do |format|
            if @user.save
                format.html { redirect_to @user, notice: 'User was successfully created.' }
                format.json { render json: @user, status: :created, location: @user }
            else
                format.html { render action: "new" }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end


    def update
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
