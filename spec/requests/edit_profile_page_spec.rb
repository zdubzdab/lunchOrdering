require 'rails_helper'

  describe "Edit_profile page" do

    subject { page }

    describe "for users" do
      let(:user) { FactoryGirl.create(:user) }
      before { visit new_user_session_path }
      before { valid_signin_user(user) }

      describe "edit profile" do
        before { visit edit_user_registration_path }

        it { should have_content("Edit User") }

        describe "with invalid information" do
          before do
            fill_in "Email",             with: "r@r.r"
            fill_in "Current password",  with: ""
            click_button "Update"
          end

          it { should have_content('Edit User') }
          it { should have_content("Current password can't be blank") }
        end

        describe "with valid information" do
          before do
            fill_in "Email",             with: "a@a.a"
            fill_in "Current password",  with: "password"
            click_button "Update"
          end

          it { should have_content('Your account has been updated successfully.') }
          it { should have_content('Lunch calendar') }
          specify { expect(user.reload.email).to  eq "a@a.a" }
        end
      end
    end
  end
