require 'rails_helper'

  describe "Welcome page" do

    subject { page }

    describe "for guests" do
      before { visit root_path }

      it { should have_content('Welcome to "LunchOrdering"') }
      it { should have_link('LunchOrdering') }
      it { should have_link('Log in') }
      it { should have_button('Log in') }
      it { should have_button('Sign up') }

      it "should have the right links on the layout" do
        click_link "LunchOrdering"
        expect(page).to have_content('Welcome to "LunchOrdering"')
        click_link "Log in"
        expect(page).to have_field("Email")
        expect(page).to have_field("Password")
        expect(page).to have_button("Log in")
        visit root_path
        click_button "Log in"
        expect(page).to have_field("Email")
        expect(page).to have_field("Password")
        expect(page).to have_button("Log in")
        visit root_path
        click_button "Sign up"
        expect(page).to have_content("Sign up")
        expect(page).to have_field("Name")
        expect(page).to have_field("Email")
        expect(page).to have_field("Password")
        expect(page).to have_field("Password confirmation")
        expect(page).to have_button("Sign up")
      end
    end

    describe "for admin" do
      before { visit new_user_session_path }
      let!(:admin) { FactoryGirl.create(:admin) }
      before { valid_signin_admin(admin) }
      before { visit root_path }
      it { should have_content('Welcome to "LunchOrdering"') }
      it { should have_link('LunchOrdering') }
      it { should have_link('Sign out') }
      it { should have_button('Home') }
      it { should have_button('Sign out') }

      it "should have the right links on the layout" do
        click_link "LunchOrdering"
        expect(page).to have_content('Welcome to "LunchOrdering"')
        click_link 'Sign out'
        expect(page).to have_content('Welcome to "LunchOrdering"')
        expect(page).to have_button("Log in")
        expect(page).to have_button("Sign up")
      end

      it "should have the right buttons on the layout" do
        click_button "Home"
        expect(page).to have_content("Listing days")
        expect(page).to have_link("Create menu")
        expect(page).to have_link("Users")
        visit root_path
        click_button "Sign out"
        expect(page).to have_content('Welcome to "LunchOrdering"')
        expect(page).to have_button("Log in")
        expect(page).to have_button("Sign up")
      end
    end

    describe "for user" do
      before { visit new_user_session_path }
      let!(:admin) { FactoryGirl.create(:admin) }
      let(:user) { FactoryGirl.create(:user) }
      before { valid_signin_user(user) }
      before { visit root_path }
      it { should have_content('Welcome to "LunchOrdering"') }
      it { should have_link('LunchOrdering') }
      it { should have_link('Sign out') }
      it { should have_button('Home') }
      it { should have_button('Sign out') }

      it "should have the right links on the layout" do
        click_link "LunchOrdering"
        expect(page).to have_content('Welcome to "LunchOrdering"')
        click_link 'Sign out'
        expect(page).to have_content('Welcome to "LunchOrdering"')
        expect(page).to have_button("Log in")
        expect(page).to have_button("Sign up")
      end

      it "should have the right buttons on the layout" do
        click_button "Home"
        expect(page).to have_content("Lunch calendar")
        expect(page).to have_button("Order")
        expect(page).to have_button("Empty menu")
        visit root_path
        click_button "Sign out"
        expect(page).to have_content('Welcome to "LunchOrdering"')
        expect(page).to have_button("Log in")
        expect(page).to have_button("Sign up")
      end
    end
  end

