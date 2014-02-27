class ProductController < ApplicationController
  def index
    @products = Product.all
  end
  
  def show
    @product = Product.where(id: params[:id]).first
  end
end