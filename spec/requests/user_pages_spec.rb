require 'spec_helper'

describe "User Pages" do
    
    subject { page }
    
    describe "profile page" do
      let (:user) { FactoryGirl.create(:user) }
      before do
        visit user_path(user)
      end
      
      it { should have_content(user.name) }
      it { should have_title(user.name) }
    end
    
    describe "signup page" do
        before { visit signup_path }
        
        let(:submit) { "Create my account" }
        describe "with invalid information" do
          it "shoul not create a user" do
            expect{ click_button submit }.not_to change(User, :count)
          end
        end
    end
    
    describe "with valid information" do
      
      before do
        visit signup_path
        
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end
      
      it "should create a user" do
        expect { click_button "Create my account" }.to change(User, :count)
      end
    end
    
end
