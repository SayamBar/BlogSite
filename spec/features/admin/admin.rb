require 'rails_helper'

RSpec.describe Admin, type: :feature do
    # AdminUser.create(email:"barsayam@email.com",password:"password")
    let!(:user1) { create(:user) }
    let!(:admin) { create(:admin_user) }
    before(:each) do
        visit new_user_session_path
        fill_in "Email", with:"admin@gmail.com"
        fill_in "Password", with:"password"
        click_button "Log in"
    end
    context "when the email and password are correct" do
        it "ensures the admin to access the dashboard" do
            visit admin_root_path
            fill_in "Email", with:"barsayam@gmail.com"
            fill_in "Password", with:"password"
            click_button "Login"
            expect(page).to have_text("Dashboard")
        end
    end

    context "when the email and password are incorrect" do
        it "ensures this will show error messages" do
            visit admin_root_path
            fill_in "Email", with:"example@gmail.com"
            fill_in "Password", with:"password"
            click_button "Login"
            expect(page).to have_text("Invalid Email or password")
        end
    end
end