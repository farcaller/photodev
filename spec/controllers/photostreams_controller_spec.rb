require 'spec_helper'

describe PhotostreamsController do

  describe "GET 'show'" do
    it "returns an photostream for logged in user" do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      sign_in user
      
      visit photostream_path
      current_path.should == photostream_path
      page.should have_selector('ul#photos')
    end
    
    it "redirects to sign in page for anonymous user" do
      visit photostream_path
      current_path.should == new_user_session_path
      page.should have_content('You must sign in to access your photostream')
    end
  end

end
