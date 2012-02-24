require 'spec_helper'

# Pages with no or little dyanmic content, like the Home or About page
describe "Static pages" do

  describe "GET /static_pages" do

    it "should return http success" do
<<<<<<< HEAD
      get static_pages_index_path
=======
      get '/static_pages/home'
>>>>>>> c5570080867cb4bd81e737e09ecbc5e2a5de7a66
      response.status.should be(200)
    end

    it "should have the content'Dating'" do
      visit '/static_pages/home'
      page.should have_content 'Dating'
    end

<<<<<<< HEAD
    
=======

>>>>>>> c5570080867cb4bd81e737e09ecbc5e2a5de7a66
  end
end
