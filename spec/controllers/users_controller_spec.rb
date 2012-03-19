require 'spec_helper'

describe UsersController do
  render_views

  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  # describe "GET 'show'" do
  #   it "should be successful" do
  #     get :show, :id => @user
  #     response.should be_success
  #   end

  #   it "should find the right user" do
  #     get :show, :id => @user
  #     assigns(:user).should == @user
  #   end

  #   it "should have the right title" do
  #     get :show, :id => @user
  #     response.body.should have_selector('title', :text => @user.name)
  #   end
  # end

  describe "POST 'create' " do

    describe "failure" do

      before(:each) do
        @attr = { :name => "", :email => "", :password => "", 
                  :password_confirmation => "" }
      end

      it "should not create a user" do
        lambda do
          post :create, :user => @attr
        end.should_not change(User, :count)
      end

      # it "should render the homepage again" do
      #   post :create, :user => @attr
      #   save_and_open_page
      #   # current_url.should =~ /users\/(\d*)\/home/
      #   # controller.action_name.should == "home"
      #   # (Rails.root + current_url).should  == root_url
      # end

    end

    describe "success" do
      
      before(:each) do
        @attr = { :name => 'New User', :email => 'newuser@example.com', 
          :password => 'foobar', :password_confirmation => 'foobar'}
      end

      it "should create a user" do
        lambda do
          post :create, :user => @attr
          response.should change( User, :count ).by 1
        end
      end

      it "should redirect to the user home page" do
        post :create, :user => @attr
        response.should redirect_to( home_user_path( assigns(:user) ) )
      end

      it "should have a welcome message" do
        post :create, :user => @attr
        flash[:success].should =~ /welcome/i
      end
      
    end

  end

end