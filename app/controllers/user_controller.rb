class UserController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
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
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]

    if @user.update_attributes user_params
      redirect_to @user, notice: 'User was successfully created.'
    else
      render action: :new
    end
  end

  # destroy

  private def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
