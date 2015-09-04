require 'rails_helper'

  describe "Welcome page" do

    subject { page }

    describe "for guests" do
      before { visit root_path }

      it { should have_content('Welcome to "LunchOrdering"') }
      it { should have_link('LunchOrdering') }
      # it { should have_link('Log in') }
      # it { should have_link('Sign up') }
      # it { should have_button('SELL') }
      # it { should have_button('BUY') }

      it "should have the right links on the layout" do
        visit root_path
        click_link "LunchOrdering"
        expect(page).to have_content('Welcome to "LunchOrdering"')
        # click_link "Log in"
        # expect(page).to have_content("Log in")
        # visit root_path
        # find(:link, "Sign up").click
        # expect(page).to have_content("Sign")
        # visit root_path
        # find(:button, "SELL").click
        # expect(page).to have_content("Sign up")
        # visit root_path
        # find(:button, "BUY").click
        # expect(page).to have_content("Books Catalog")
      end
    end

    # describe "for signed-in users" do
    #   before { visit new_user_session_path }
    #   let(:user) { FactoryGirl.create(:user) }
    #   before { valid_signin(user) }
    #   before { visit root_path }

    #   it { should have_content('Welcome to DEPOT') }
    #   it { should have_link('Sign out') }

    #   it "should have the right links on the layout" do
    #     visit root_path
    #     click_link "Depot"
    #     expect(page).to have_content("Welcome to DEPOT")
    #     visit root_path
    #     find(:button, "SELL").click
    #     expect(page).to have_content("Listing Products")
    #     expect(page).to have_link("Edit my profile")
    #     visit root_path
    #     find(:button, "BUY").click
    #     expect(page).to have_content("Books Catalog")
    #     click_link "Sign out"
    #     expect(page).to have_link("Log in")
    #     expect(page).not_to have_link("Sign out")
    #   end
    # end
  end

