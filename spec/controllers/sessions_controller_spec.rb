# require 'spec_helper'

# describe SessionsController do
#   render_views

#   before(:all) do
#     User.create!(:name => 'user', :email => 'user@example.com', :password => 'foobar', :password_confirmation => 'foobar')
#   end


#   describe "DELETE 'destroy'" do
#   end

#   describe "POST 'create'" do
#     describe 'success: it should log the user in' do
#       before(:each) do
#         params[:session][:email] = 'user@example.com'
#         params[:session][:password] = 'foobar'
#       end

#       it "should redirect to the user's home page" do
#         post(:create)
#         current_url.should =~ /users\/(\d*)\/home/
#       end

#       it "should show a welcome message" do
#         post(:create)
#         flash[:success].should =~ /welcome/i
#       end

#       it "should show a log out button" do
#         post(:create)
#         response.body.should have_content('Log out')
#       end

#     end

#     describe 'failure: it should not log the user in' do
#       before(:each) do
#         visit '/'
#         within 'div.login' do
#           fill_in "Email",    :with => ''
#           fill_in "Password", :with => ''
#           click_button 'Log in'
#         end
#       end

#       it "should redirect to the login page" do
#         current_url.should == login_url
#       end

#       it "should show an error message" do
#         flash[:error].should =~ /username or password/
#       end
#     end
#   end

# end