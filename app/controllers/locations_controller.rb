class LocationsController < ApplicationController
    before_filter :require_login
    
    def index
        if current_user.internal == true
            @locations = Location.all
            render "index_internal"
        else
            if params[:state_name]
                @state = State.find_by_name(params[:state_name])
                @locations = Location.where("customer_id = ? AND state_id = ?", current_user.customer_id, @state.id)
            else
                @locations = Location.where("customer_id = ?", current_user.customer_id)
            end
            render "index"
        end
    end

    def show
        #theoretically a customer would not think to put another number that does not belong to them, but eventually this needs more security
        @location = Location.find(params[:id])
    end

    def new
        @location = Location.new
        @location.customer_id = params[:customer_id]
    end

    # GET /locations/1/edit
    def edit
        @location = Location.find(params[:id])
    end

    # POST /locations
    # POST /locations.json
    def create
		@location = Location.new(params[:location])

		respond_to do |format|
			if @location.save
				format.html { redirect_to @location, notice: 'Location was successfully created.' }
				format.json { render json: @location, status: :created, location: @location }
			else
				format.html { render action: "new" }
				format.json { render json: @location.errors, status: :unprocessable_entity }
			end
		end
    end

  # PUT /locations/1
  # PUT /locations/1.json
  def update
    @location = Location.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location])
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to locations_url }
      format.json { head :no_content }
    end
  end
end
