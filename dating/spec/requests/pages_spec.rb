# Static pages with little or no dyanmic content, like the Home or About page

require 'spec_helper'

describe "Pages" do

  before(:each) do
    @base_title = "Off the Rails Dating App | "
  end

  describe "The home page" do

    it "should have the right title" do
      visit 'home'
      page.should have_selector('title', :text => @base_title + 'Home')
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
