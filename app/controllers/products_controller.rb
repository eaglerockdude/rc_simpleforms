
class ProductsController < ApplicationController
  def index
    @products = Product.order("name")
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    # @product = Product.new(params[:product])
    if @product.save
      redirect_to @product, notice: "Successfully created product."
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product, notice: "Successfully updated product."
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_url, notice: "Successfully destroyed product."
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit!
  end
end