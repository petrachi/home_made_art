class AuthenticationController < ApplicationController

  def sign_in
    @user = User.new
  end

  def log_in
    @user = User.where(email: sign_in_params[:email]).first

    if @user and @user.authenticate sign_in_params[:password]
      session[:user_id] = @user.id
      redirect_to @user, notice: 'You have logged in.'
    else
      render action: :sign_in
    end
  end

  def sign_out
    session[:user_id] = nil
    redirect_to root_url, notice: "You have signed out."
  end


  private def sign_in_params
    params[:sign_in]
  end
end
