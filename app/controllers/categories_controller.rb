class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
  end


  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        redirect_to @category, notice: I18n.t('model.created', class_name: @category.class)
      else
        render action: :new
      end
    end
  end


  def edit
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        redirect_to @category, notice: I18n.t('model.updated', class_name: @category.class)
      else
        render action: :edit
      end
    end
  end


  def destroy
    @category.destroy
    redirect_to categories_url
  end


  private def set_category
    @category = Category.find(params[:id])
  end

  private def category_params
    params.require(:category).permit(:name)
  end
end
