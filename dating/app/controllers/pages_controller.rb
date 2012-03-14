class PagesController < ApplicationController
  before_filter :confirm_logged_in, :except => [:home, :help, :about]
  def home
    @title = 'Home'
  end

  def help
    @title = 'Help'
  end

  def about
    @title = 'About'
  end

end
