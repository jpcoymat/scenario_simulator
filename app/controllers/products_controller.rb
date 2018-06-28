class ProductsController  < ApplicationController
  
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_organization

  def index
    @products = Product.all
  end

  # GET /organizations/:organization_id/products/1
  # GET /organizations/:organization_id/products/1.json
  def show
    
  end

  # GET /organizations/:organization_id/products/new
  def new
    @product = Product.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /organizations/:organization_id/products/1/edit
  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /organizations/:organization_id/products/
  # POST /organizations/:organization_id/products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
        format.js { render :index}
      else
        format.html { render :new }
        format.js {render :new}
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizations/:organization_id/products/1
  # PATCH/PUT /organizations/:organization_id/products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
        format.js {render :index}
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
        format.js {render :edit}
      end
    end
  end

  # DELETE /organizations/:organization_id/products/1
  # DELETE /organizations/:organization_id/products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to organization_products_path(@organization), notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
      format.js {render :index}
    end
  end


  private


  def set_product
     @product = Product.find(params[:id])
  end

  def set_organization
    @organization = Organization.find(params[:organization_id])
  end
  
  def product_params
    params.require(:product).permit(:name, :code, :unit_weight, :unit_volume, :unit_price, :organization_id)
  end


end
