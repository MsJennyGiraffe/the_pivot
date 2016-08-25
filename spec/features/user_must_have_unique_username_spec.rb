require 'rails_helper'

RSpec.feature "a user must have a unique username" do
  scenario "user tries to make duplicate username" do
      user_1 = User.create!(username: "business_1", password: "password", email: "test@gmail.com" )

      visit new_user_path
      fill_in "Username", with: "business_1"
      fill_in "Password", with: "password"
      fill_in "Email", with: "test@gmail.com"
      click_button "Create Account"

      expect(page).to have_content("Username has already been taken, Email has already been taken")
  end
end
