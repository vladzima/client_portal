class CustomerFilesController < ApplicationController
    before_filter :require_login

    def index
        if current_user.internal
            if params[:category]
                @customer_files = CustomerFile.where("category_id = ?", params[:category])
                @filetype = Category.find(params[:category]).name
            else
                @customer_files = CustomerFile.all
                @filetype = "File"
            end
        else #for customer user
            if params[:category]
                @customer_files = CustomerFile.where("category_id = ? AND customer_id = ?", params[:category], current_user.customer_id)
                @filetype = Category.find(params[:category]).name
            else
                @customer_files = CustomerFile.where("customer_id = ?", current_user.customer_id)
                @filetype = "File"
            end
        end
    end

    def show
        @customer_file = CustomerFile.find(params[:id])

        respond_to do |format|
            format.html # show.html.erb
            format.json { render json: @customer_file }
        end
    end

    def new
        @customer_file = CustomerFile.new
        @filetype = "File"
        if current_user.internal == true
            if params[:location_id]
                @location = Location.find(params[:location_id])
                @customer_file.location_id = params[:location_id]
                @customer_file.customer_id = @location.customer_id
            elsif params[:customer_id]
                @customer_file.customer_id = params[:customer_id]
            end
        else
            @customer_file.customer_id = current_user.customer_id
            
        end
        
        if params[:category_id]
            @customer_file.category_id = params[:category_id]
        end
    end
    
    def edit
        @customer_file = CustomerFile.find(params[:id])
    end

    def create
        @customer_file = CustomerFile.new(params[:customer_file])

        respond_to do |format|
          if @customer_file.save
            format.html { redirect_to @customer_file, notice: 'Customer file was successfully created.' }
            format.json { render json: @customer_file, status: :created, location: @customer_file }
          else
            format.html { render action: "new" }
            format.json { render json: @customer_file.errors, status: :unprocessable_entity }
          end
        end
    end

    def update
        @customer_file = CustomerFile.find(params[:id])

        respond_to do |format|
            if @customer_file.update_attributes(params[:customer_file])
                format.html { redirect_to @customer_file, notice: 'Customer file was successfully updated.' }
                format.json { head :no_content }
            else
                format.html { render action: "edit" }
                format.json { render json: @customer_file.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @customer_file = CustomerFile.find(params[:id])
        @customer_file.destroy

        redirect_to customer_files_url
    end
  
    #def download
    #    send_file
    #end
end
