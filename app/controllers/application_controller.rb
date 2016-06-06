class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #methods to help other methods
  helper_method :current_user, :logged_in?, :require_user


  #current user or/equals this
  def current_user
  	@current_user ||= Chef.find(session[:chef]) if session[:chef]
  end


  def logged_in?
  	!!current_user
  end

  #if not logged in, it was flash this 
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in"
      redirect_to recipes_path
    end
  end

end
