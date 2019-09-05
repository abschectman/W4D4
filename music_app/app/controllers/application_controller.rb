class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?


  #current_user to return the current user.
#logged_in? to return a boolean indicating whether someone is signed in.
#log_in_user!(user)

  def current_user
    @current_user = User.find_by(session_token: session[:session_token])
    @current_user
  end

  def logged_in?
    self.current_user
  end

  def log_in_user!(user)
    session[:session_token] = user.session_token
  end



end
