class PagesController < ApplicationController
  def home
    @title = 'Home'

    # Sign up form
    if @user.nil?
      @user = User.new
    end
  end

  def help
    @title = 'Help'
  end

  def about
    @title = 'About'
  end

end
