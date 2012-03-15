require 'spec_helper'

describe UsersController do
  render_views

  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  describe "GET 'show'" do
    it "should be successful" do
      get :show, :id => @user
      response.should be_success
    end

    it "should find the right user" do
      get :show, :id => @user
      assigns(:user).should == @user
    end

    it "should have the right title" do
      get :show, :id => @user
      response.body.should have_selector('title', :text => @user.name)
    end
  end

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

      # Once the POST fails, it should render the homepage again
      it "should have the right title" do
        post :create, :user => @attr
        response.body.should have_selector("title", :content => "Home")
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

      it "should redirect to the user show page" do
        post :create, :user => @attr
        response.should redirect_to( user_path( assigns(:user) ) )
      end

      it "should have a welcome message" do
        post :create, :user => @attr
        flash[:success].should =~ /welcome/i
      end
      
    end

  end

  end

end