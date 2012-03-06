# Static pages with little or no dyanmic content, like the Home or About page

require 'spec_helper'

describe "Pages" do

  describe "The home page" do

    describe "Signup" do
      before(:each) do
        visit signup_url
      end

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
      before(:each) do
        visit login_url
      end
      
      describe "incorrect credentials" do
        it "should not sign the user in" do
          within 'div.login' do
            fill_in "Email",    :with => ""
            fill_in "Password", :with => ""
            click_button "Log in"
          end
          page.should have_selector('div.flash.error', :text => "Invalid")
          page.body.should have_selector('div.signup')
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
          current_url.should =~ /users\/(\d*)\/home/
          page.should have_content("Log out")
        end
      end
    end



  end

end
