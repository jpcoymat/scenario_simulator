class OrganizationLinksController < ApplicationController
  
  before_action :set_focal_organization
  before_action :set_organization_link, only: [:show, :edit, :update, :destroy]
  
  def index
  end

  # GET /organizations/:organization_id/organization_links/1
  # GET /organizations/:organization_id/organization_links/1.json  
  def show
    
  end
  
  # GET /organizations/:organization_id/organization_links/1/edit
  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  # GET /organizations/:organization_id/organization_links/1/new
  def new
    @organization_link = OrganizationLink.new
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  
  # PATCH/PUT  /organizations/:organization_id/organization_links/1
  def update
    respond_to do |format|
      if @organization_link.update(organization_link_params)
        format.html {redirect_to @organization_link, notice: "Link created successfully"}
        format.js {render :index}
        format.json { render :show, status: :created, location: @organization_link }
      else
        format.html {render :new}
        format.js {render :new}
        format.json {render json: @organization_link.errors, status: :unprocessable_entity}
      end
    end
  end
  
  # POST /organizations/:organization_id/organization_links/
  def create
    @organization_link = OrganizationLink.new(organization_link_params)
    respond_to do |format|
      if @organization_link.save
        format.html {redirect_to @organization_link, notice: "Link created successfully"}
        format.js {render :index}
        format.json { render :show, status: :created, location: @organization_link }
      else
        format.html {render :new}
        format.js {render :new}
        format.json {render json: @organization_link.errors, status: :unprocessable_entity}
      end
    end
  end
  
  # DELETE /organizations/:organization_id/organization_links/1
  def destroy
    @organization_link.destroy
    respond_to do |format|
      format.html { redirect_to organization_network_index(@focal_organization), notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
      format.js {render :index}
    end
    
  end
  
  private
  
  def set_focal_organization
    @focal_organization = Organization.where(id: params[:organization_id]).first
  end
  
  def set_organization_link
    @organization_link = OrganizationLink.find(params[:id])
  end
  
  def organization_link_params
    params.require(:organization_link).permit(:focal_organization_id, :service_organization_id, :service_function)
  end
  
end
