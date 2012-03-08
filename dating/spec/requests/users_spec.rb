require 'spec_helper'

# Insert tests for all the views related to the users controller
#  * User's profile page
#  * (?) User's home page
#  *

describe "Users" do
  before(:all) do
    @attr = {
      :name => "Example",
      :email => "user@example.com",
      :password => "foobar",
      :password_confirmation => "foobar"
    }
    User.create!(@attr)
  end

  describe "Profile page" do


    # The profile page when the user first signs up
    # and has not filled in anything 
    describe "New user" do
      before(:each) do
        visit user_url(User.find_by_email('user@example.com'))
      end

      xit "should have a default profile picture" do
        # page.should_not have_selector('alt', )
      end

    end

  end

  describe "edit" do
    before(:each) do
      visit edit_user_path(User.find_by_email 'user@example.com' )

      describe "page" do
        it "should show the right page with sensible content" do
          page.should have_selector('h1', :text => "Edit")
        end

        


  
end
