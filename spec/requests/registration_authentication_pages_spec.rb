require 'rails_helper'

describe "Registration_Authentication pages" do

  subject { page }

  describe "First sign up (admin)" do

    before { visit new_user_registration_path }

    let(:submit) { "Sign up" }

    describe "with invalid information" do
      before do
        fill_in "Name",                   with: ""
        fill_in "Email",                  with: "user@example.com"
        fill_in "Password",               with: "password"
        fill_in "Password confirmation",  with: "password"
      end

      it { should have_content('Sign up') }
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",                   with: "user"
        fill_in "Email",                  with: "user@example.com"
        fill_in "Password",               with: "password"
        fill_in "Password confirmation",  with: "password"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }

        it { should have_link('Sign out') }
        it { should have_content('Listing days') }
      end
    end
  end

  describe "Second sign up (user)" do

    before { visit new_user_registration_path }
      let!(:admin) { FactoryGirl.create(:admin) }
      let(:user) { FactoryGirl.create(:user) }
      let(:submit) { "Sign up" }

    describe "with valid information" do
      before do
        fill_in "Name",                   with: "user"
        fill_in "Email",                  with: "user@example.com"
        fill_in "Password",               with: "password"
        fill_in "Password confirmation",  with: "password"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }

        it { should have_link('Sign out') }
        it { should have_content('Lunch calendar') }
      end
    end
  end

  describe "admin log in" do
    before { visit new_user_session_path }

    describe "with invalid information" do
      before { click_button "Log in" }

      it { should have_button('Log in') }
      it { should have_selector('h2', text: "Log in") }
    end

    describe "with valid information" do
      let(:admin) { FactoryGirl.create(:admin) }
      before { valid_signin_admin(admin) }

      it { should have_link("Sign out") }
      it { should have_content("Listing days") }
      it { should have_content("Signed in successfully") }

      describe "followed by signout" do
        before { click_link "Sign out" }
        it { should have_link('Log in') }
        it { should have_content('Signed out successfully.') }
      end
    end
  end

  describe "user log in" do
    before { visit new_user_session_path }

    describe "with invalid information" do
      before { click_button "Log in" }

      it { should have_button('Log in') }
      it { should have_selector('h2', text: "Log in") }
    end

    describe "with valid information" do
      let!(:admin) { FactoryGirl.create(:admin) }
      let(:user) { FactoryGirl.create(:user) }
      before { valid_signin_user(user) }

      it { should have_link("Sign out") }
      it { should have_content("Lunch calendar") }
      it { should have_content("Signed in successfully") }

      describe "followed by signout" do
        before { click_link "Sign out" }
        it { should have_link('Log in') }
        it { should have_content('Signed out successfully.') }
      end
    end
  end
end