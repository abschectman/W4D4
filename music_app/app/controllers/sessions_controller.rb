class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.find_by(email: the_params[:email])
    if user && user.is_password?(the_params[:password])
      session[:session_token] = user.session_token
      redirect_to bands_url
    else
      flash.now[:errors] = "Bad login info"
    end
  end

  def destroy
    self.current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end

  private
  def the_params
    params.require(:user).permit(:email, :password, :session_token, :password_digest)
  end

end