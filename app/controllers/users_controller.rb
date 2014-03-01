class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render action: :new
    end
  end


  def edit
  end

  def update
    if @user.update_attributes user_params
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: :new
    end
  end


  def destroy
    @user.destroy
    redirect_to categories_url
  end


  private def set_product
    @user = User.find params[:id]
  end

  private def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
