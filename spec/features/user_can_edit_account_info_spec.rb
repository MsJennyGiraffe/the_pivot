require 'rails_helper'

RSpec.feature "a user can edit account info" do
  scenario "a user edits their information" do
      user_1 = User.create!(username: "business_1", password: "password", email: "test@gmail.com" )

      visit login_path
      fill_in "Username", with: "business_1"
      fill_in "Password", with: "password"
      click_button "Login"

      visit edit_user_path(user_1)

      fill_in "Username", with: "business_5"
      fill_in "Email", with: "TEST"
      fill_in "Password", with: "password"

      click_on "Edit User"

      expect(current_path).to eq(user_path(user_1))

      expect(page).to have_content("business_5")
      expect(page).to have_content("TEST")
  end

  scenario "a user cannot make same username as another user" do
      user_1 = User.create!(username: "business_1", password: "password", email: "test@gmail.com" )
      user_2 = User.create!(username: "business_2", password: "password", email: "test1@gmail.com" )

      visit login_path
      fill_in "Username", with: "business_1"
      fill_in "Password", with: "password"
      click_button "Login"

      visit edit_user_path(user_1)

      fill_in "Username", with: "business_2"
      fill_in "Email", with: "TEST"
      fill_in "Password", with: "password"

      click_on "Edit User"

      expect(page).to have_content("BUSINESS_1")
      expect(page).to have_content("Edit Account")
  end
end
