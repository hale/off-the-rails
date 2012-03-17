class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  has_mobile_fu

  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in."
      redirect_to root_url
      return false
    else
      return true
    end
  end

private 

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
