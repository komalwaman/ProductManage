class ProductsController < ApplicationController
  
  def index
    @products = ProductDecorator.decorate_collection(Product.all)
  end

  def show
    @product = ProductDecorator.new(Product.find(params[:id]))
  end

  def new
    type = params[:product_type]
    @product = ProductDecorator.new(Product.new(:product_type => type))
  end

  def create
    @products = ProductDecorator.decorate_collection(Product.all)
    @product = Product.create(product_params)
  end

  def edit
    @product = ProductDecorator.new(Product.find(params[:id]))
  end

  def update
    @products = ProductDecorator.decorate_collection(Product.all)
    @product = ProductDecorator.new(Product.find(params[:id]))
    
    @product.update_attributes(product_params)
  end

  def delete
    @product = ProductDecorator.new(Product.find(params[:product_id]))
  end

  def destroy
    @products = ProductDecorator.decorate_collection(Product.all)
    @product = ProductDecorator.new(Product.find(params[:id]))
    @product.destroy
  end

private
  # Only allow a trusted parameter "white list" through.
  def product_params
    params.require(:product).permit(:name, :price, :color, :product_status, :inward_date, :product_type, :description)
  end
end

