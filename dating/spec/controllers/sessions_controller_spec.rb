require 'spec_helper'

describe SessionsController do
  render_views

  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  describe "DELETE 'destroy'" do
  end

  describe "POST 'create'" do
    describe 'success' do
      before(:each) do
        @attr = {:email => 'user@example.com', :password => 'foobar'}
      end

      it "should log the user in" do
        post :create, :user => @attr
        # response.should change(session, :count).by 1
      end

      xit "should redirect to the user's home page" do
      end

      xit "should show a welcome message" do
      end

    end

    describe 'failure' do
      before(:each) do
        @attr = {:email => '', :password => ''}
      end

      xit "should not log the user in" do
      end

      xit "should redirect to the home page" do
      end

      xit "should show an error message" do
      end
    end
  end

end