class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
    @products = @products.search params[:search] if params[:search]
  end

  def show
  end


  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params

    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render action: :new
    end
  end


  def edit
  end

  def update
    if @product.update_attributes product_params
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render action: :new
    end
  end


  def destroy
    @product.destroy
    redirect_to categories_url
  end


  private def set_product
    @product = Product.find params[:id]
  end

  private def product_params
    params.require(:product).permit(:user_id, :category_id, :name, :brief, :descr, :price, :weight)
  end
end
