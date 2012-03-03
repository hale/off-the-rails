# Static pages with little or no dyanmic content, like the Home or About page

require 'spec_helper'

describe "Pages" do

  before(:each) do
    @base_title = "Off the Rails Dating App | "
  end

  describe "The home page" do

    before(:each) do
      visit '/'
    end

    it "should have the right title" do
      page.should have_selector('title', :text => 'Home')
    end

    describe "Signup" do
      describe "failure" do
        it "should not make a new user" do
          within 'div.signup' do
            lambda do
              fill_in "Name",                   :with => ""
              fill_in "Email",                  :with => ""
              fill_in "Password",               :with => ""
              fill_in "Password confirmation",  :with => ""
              click_button "Sign up"
            end.should change(User, :count).by(0)
          end
          page.should have_selector("div.error")
          page.should have_selector("div.signup")
        end
      end
      describe "success" do
        it "should make a new user" do
          within 'div.signup' do
            lambda do
              fill_in "Name",                   :with => "Example User"
              fill_in "Email",                  :with => "user@example.com"
              fill_in "Password",               :with => "foobar"
              fill_in "Password confirmation",  :with => "foobar"
              click_button "Sign up"
            end.should change(User, :count).by(1)
          end
          page.should have_selector("div.flash.success")
          page.should have_content "Welcome" 
          # page.should render_template "users#home"
        end
      end    
    end

    describe "Login" do
      describe "incorrect credentials" do
        it "should not sign the user in" do
          within 'div.login' do
            fill_in "Email",    :with => ""
            fill_in "Password", :with => ""
            click_button "Log in"
          end
          page.should have_selector('div.flash.error', :text => "Invalid")
        end
      end
      describe "correct credentials" do
        it "should sign the user in" do
          User.create!(:name => 'user', :email => 'user@example.com', :password => 'foobar', :password_confirmation => 'foobar')
          within 'div.login' do
            fill_in "Email",    :with => "user@example.com"
            fill_in "Password", :with => 'foobar'
            click_button 'Log in'
          end
          page.should have_selector("div.flash.success", text: 'Welcome back')
          # page.should have_selector("title", text: ) TODO: INSERT TITLE OF THE USER'S HOME PAGE
        end
      end
    end



  end

  describe "The about page" do
    it "should have the right title" do
      visit '/about'
      page.should have_selector('title', :text => @base_title + 'About')
    end
  end

  describe "The help page" do
    it "should have the right title" do
      visit '/help'
      page.should have_selector('title', :text => @base_title + 'Help')
   end
  end

end
