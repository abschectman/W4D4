class UsersController < ApplicationController
  
  
  def new
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:session_token] = user.session_token
      redirect_to bands_url
    else
      flash.now[:errors] = "Invalid login info"
    end
  end

  def destroy
  end

  def show
    render :show
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_digest, :session_token)
  end
end