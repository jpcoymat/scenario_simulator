class LocationsController  < ApplicationController

  before_action :set_location, only: [:show, :edit, :update, :destroy]
  before_action :set_organization

  def index
    @locations = Location.all
  end

  # GET /organizations/:organization_id/locations/1
  # GET /organizations/:organization_id/locations/1.json
  def show
  end

  # GET /organizations/:organization_id/locations/new
  def new
    @location = Location.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /organizations/:organization_id/locations/1/edit
  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /organizations/:organization_id/locations/
  # POST /organizations/:organization_id/locations.json
  def create
    @location = Location.new(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
        format.js { render :index}
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
        format.js { render :new}
      end
    end
  end

  # PATCH/PUT /organizations/:organization_id/locations/1
  # PATCH/PUT /organizations/:organization_id/locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
        format.js { render :index }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
        format.js { render :edit}
      end
    end
  end

  # DELETE /organizations/:organization_id/locations/1
  # DELETE /organizations/:organization_id/locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to organization_locations_path(@organization), notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private


  def set_location
     @location = Location.find(params[:id])
  end

  def set_organization
    @organization = Organization.find(params[:organization_id])
  end
  
  def location_params
    params.require(:location).permit(:code, :name, :address, :city, :state_providence, :postal_code, :country, :latitude, :longitude, :organization_id)
  end

end
