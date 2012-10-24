class CustomersController < ApplicationController
    before_filter :require_login
    before_filter :internal_only, :only => [ :show, :edit, :update, :show, :create, :update, :destroy ]
    
    #include CustomerHelper
    #include ActionView::Helpers::CustomerHelper
    
    def index
        if current_user.internal == true
            @customers = Customer.all
        else
            @customer = Customer.find(current_user.customer_id)
            @stateLocCount = Location.getStateLocCountHash(@customer.locations)
            render "show"
        end
    end

    def show
        if current_user.internal == true
            @customer = Customer.find(params[:id])
        else
            @customer = Customer.find(current_user.customer_id)
        end
        @stateLocCount = Location.getStateLocCountHash(@customer.locations)
    end

    def new
        @customer = Customer.new
    end

    # GET /customers/1/edit
    def edit
        @customer = Customer.find(params[:id])
    end

    def create
        @customer = Customer.new(params[:customer])

        if @customer.save
            redirect_to @customer, notice: 'Customer was successfully created.'
        else
            render action: "new"
        end
    end
    
    def update
        @customer = Customer.find(params[:id])
        
        if @customer.update_attributes(params[:customer])
            redirect_to @customer, notice: 'Customer was successfully updated.'
        else
            render action: "edit"
        end
    end

    def destroy
        @customer = Customer.find(params[:id])
        @customer.destroy

        redirect_to customers_url
    end
    
    def helpers
        ActionController::Base.helpers
    end
end