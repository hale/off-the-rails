require 'spec_helper'

describe PagesController do
  render_views

  before(:each) do
    @base_title = "Coitus Cupid | "
  end

  describe "The home page" do
    it "should have the right title" do
      visit 'home'
      page.should have_selector('title', :text => @base_title + 'Home')
    end

    it "should log the user out" do
      session[:user_id] = 999
      visit 'home'
      session[:user_id].should be_nil
    end

  end


end