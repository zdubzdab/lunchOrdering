require 'rails_helper'

  describe "Person page" do

    subject { page }

    describe "for users" do
      let(:user) { FactoryGirl.create(:user) }
      let!(:admin) { FactoryGirl.create(:admin) }
      let!(:day) { FactoryGirl.create(:day, user: admin) }
      let!(:first_course) { FactoryGirl.create(:first_course, day: day) }
      let!(:second_course) { FactoryGirl.create(:second_course, day: day) }
      let!(:drink) { FactoryGirl.create(:drink, day: day) }
      before { visit new_user_session_path }
      before { valid_signin_user(user) }
      before { visit user_root_path }

      it { should have_no_link('Admin side') }
      it { should have_link('LunchOrdering') }
      it { should have_link('Sign out') }
      it { should have_selector('h4', text: "Your Menu") }
      it { should have_button('Order') }
      it { should have_button('Empty menu') }
      it { should have_selector('h3', text: "name:") }
      it { should have_selector('h3', text: "email:") }
      it { should have_link('Edit my profile') }
      it { should have_selector('#calendar_table', text: "Lunch calendar") }
      it { should have_selector('tr', text: "Sunday") }

      it "should have the right links on the layout" do
        click_link 'Show menu'
        expect(page).to have_content('First courses:')
        expect(page).to have_content('Second courses:')
        expect(page).to have_content('Drinks:')
        expect(page).to have_button("Choose drink")
        visit user_root_path
        click_link 'Edit my profile'
        expect(page).to have_content('Edit User')
        expect(page).to have_field("Name")
        expect(page).to have_field("Email")
        expect(page).to have_field("Password")
        expect(page).to have_field("Password confirmation")
        expect(page).to have_button("Update")
      end

      describe "choose courses and add it cart" do
        before { click_link 'Show menu' }

        it "should create items in cart" do
          expect { first(:button, "Choose first course").click }.to change(FirstItem, :count).by(1)
          expect { first(:button, "Choose second course").click }.to change(SecondItem, :count).by(1)
          # expect { first(:button, "Choose drink").click }.to change(DrinkItem, :count).by(1)
        end

        describe "I should see choosen courses in the cart" do
          before do
            first(:button, "Choose first course").click
            first(:button, "Choose second course").click
            # first(:button, "Choose drink").click
          end

            it { should have_css("#table_and_buttons", text: first_course.name) }
            it { should have_css("#table_and_buttons", text: second_course.name) }
            # it { should have_css("#table_and_buttons", text: drink.name) }
        end
      end

      describe "shouldn't add more than one item from course to the cart" do
        let!(:first_course) { FactoryGirl.create(:first_course, day: day) }
        # let!(:second_course) { FactoryGirl.create(:second_course, day: day) }
        # let!(:drink) { FactoryGirl.create(:drink, day: day) }
        before do
          click_link 'Show menu'
          # all(:button, "Choose first course").each(&:click)
          first(:button, "Choose first course").click
          # all(:button, "Choose second course").each(&:click)
          # all(:button, "Choose drink").each(&:click)
        end

        it "should add only one item from first course and see alert", :js => true do
          page.accept_alert 'You can order only one first course' do
            first(:button, "Choose first course").click
          end
          expect { first(:button, "Choose first course").click }.not_to change(FirstItem, :count)
        end

        # it "should add only one item from second course and see alert", :js => true do
        #   page.accept_alert 'You can order only one second course' do
        #     first(:button, "Choose second course").click
        #   end
        #   expect { first(:button, "Choose second course").click }.not_to change(SecondItem, :count)
        # end

        # it "should add only one item from drink and see alert", :js => true do
        #   page.accept_alert 'You can order only one drink' do
        #     first(:button, "Choose drink").click
        #   end
        #   expect { first(:button, "Choose drink").click }.not_to change(DrinkItem, :count)
        # end
      end

      describe "delete all items from cart" do
        before do
          click_link 'Show menu'
          first(:button, "Choose first course").click
          first(:button, "Choose second course").click
          first(:button, "Choose drink").click
        end

        it "should delete first_items from cart" do
          expect { click_button "Empty menu" }.to change(FirstItem, :count).by(-1)
        end
        it "should delete first_items from cart" do
          expect { click_button "Empty menu" }.to change(SecondItem, :count).by(-1)
        end
        it "should delete first_items from cart" do
          expect { click_button "Empty menu" }.to change(DrinkItem, :count).by(-1)
        end

        describe "should see empty cart", :js => true do
          before do
            page.accept_confirm 'Are you sure?' do
              click_button 'Empty menu'
            end
          end
          it { should have_content('Your Menu is empty') }
        end
      end


      describe "ordering choosen courses" do
        # describe "with invalid information" do
        #   before do
        #     click_link 'Show menu'

        #   end

        #   # it { should have_content('Your order is empty or there are courses which are not in today menu') }
        #   it "should not create a order" do
        #     expect { click_button 'Order' }.not_to change(Order, :count)
        #   end
        # end

        describe "with valid information" do
          before do
            click_link 'Show menu'
            first(:button, "Choose first course").click
            first(:button, "Choose second course").click
            first(:button, "Choose drink").click
          end

          it "should create order" do
            expect { click_button 'Order' }.to change(Order, :count).by(1)
          end

          # describe "I should see choosen courses in the cart" do
          #   before do
          #     first(:button, "Choose first course").click
          #     first(:button, "Choose second course").click
          #     first(:button, "Choose drink").click
          #   end

          #   it { should have_css("#table_and_buttons", text: first_course.name) }
          #   it { should have_css("#table_and_buttons", text: second_course.name) }
          #   it { should have_css("#table_and_buttons", text: drink.name) }
          # end
        end
      end

    end
  end