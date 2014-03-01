class ProductController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.where(id: params[:id]).first
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
    @product = Product.find params[:id]
  end

  def update
    @product = Product.find params[:id]

    if @product.update_attributes product_params
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render action: :new
    end
  end

  # destroy


  private def product_params
    params.require(:product).permit(:user, :title, :price)
  end
end
