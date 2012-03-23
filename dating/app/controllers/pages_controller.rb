class PagesController < ApplicationController
  before_filter :confirm_logged_in, :except => [:home]
  def home
    # Visiting the root url logs the user out.
    unless session[:user_id].nil?
      session[:user_id] = nil
      flash.now[:success] = 'You have been logged out.'
    end
    @title = 'Home'
  end

end
