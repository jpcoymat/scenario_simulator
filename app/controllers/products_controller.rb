class ProductsController  < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_organization

  def index
    @products = Product.all
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
  end

  # GET /organizations/new
  def new
    @product = Product.new
  end

  # GET /organizations/1/edit
  def edit
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @product = Product.new(organization_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizations/1
  # PATCH/PUT /organizations/1.json
  def update
    respond_to do |format|
      if @product.update(organization_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to organizations_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private


  def set_product
     @product = Product.find(params[:id])
  end

  def set_organization
    @organization = Organization.find(params[:organization_id])
  end


end
