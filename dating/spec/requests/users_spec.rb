require 'spec_helper'
# require 'ap'

describe "Users" do
  describe "Signup" do

    describe "failure" do
      it "should not make a new user" do
        visit root_url
        within 'div.signup' do
          lambda do
            fill_in "Name",             :with => ""
            fill_in "Email",                  :with => ""
            fill_in "Password",               :with => ""
            fill_in "Password confirmation",  :with => ""
            click_button "Sign up"
          end.should change(User, :count).by(1)
        end
        page.should have_selector("div#errors")
      end

    end

    describe "success" do
      it "should make a new user" do
        visit root_url
        within 'div.signup' do
          lambda do
            fill_in "Name",             :with => "Example User"
            fill_in "Email",                  :with => "user@example.com"
            fill_in "Password",               :with => "foobar"
            fill_in "Password confirmation",  :with => "foobar"
            click_button "Sign up"
            # page.should have_selector("div#flash#success")           
          end.should change(User, :count).by(1)
        end
        page.should have_content("Welcome") 
      end
    end

    
  end
end
