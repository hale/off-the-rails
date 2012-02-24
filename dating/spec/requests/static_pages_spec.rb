require 'spec_helper'

# Pages with no or little dyanmic content, like the Home or About page
describe "Static pages" do

  describe "GET /static_pages" do

    it "should return http success" do
      get static_pages_index_path
      response.status.should be(200)
    end

    it "should have the content'Dating'" do
      visit '/static_pages/home'
      page.should have_content 'Dating'
    end

    
  end
end
