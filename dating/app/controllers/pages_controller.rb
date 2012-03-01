class PagesController < ApplicationController
  def home
    @title = 'Home'

    # Sign up form.  Need to save the error messages to a 
    # new global variable in the create action in the Users controller.
    # Then change the errors partial to look for that new variable. Then 
    # We can see what's going wrong with the signup form - why it won't submit.
    #
    # ...unless it's not submitting for another reason :s
    @user = User.new
  end

  def help
    @title = 'Help'
  end

  def about
    @title = 'About'
  end

end
