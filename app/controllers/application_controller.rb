class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_user
  
  helper_method :current_user_session, :current_user
  
  private
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  def require_user
    unless current_user
      flash[:notice] = "You must be logged in to access this page"
      redirect_to new_user_session_path
      return false
    end
  end
  
  def require_no_user 
    if current_user
      redirect_to root_url
      return false 
    end 
  end
  
  
end
