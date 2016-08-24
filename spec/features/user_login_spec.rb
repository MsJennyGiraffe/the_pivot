require 'rails_helper'

RSpec.feature "User logs in" do
  scenario "creating a new account" do
    visit root_path
    click_link "Sign Up"

    fill_in "Username", with: "user"
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"

    click_button "Create Account"

    user = User.last

    expect(current_path).to eq("/users/#{user.id}")
    expect(page).to have_content("Hello #{user.username.upcase}")
    expect(page).to_not have_content("Login")
    expect(page).to have_content("Logout")
  end

  scenario "existing user can login" do
    user = create(:user)

    visit root_path
    click_link "Login"
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Login"

    expect(current_path).to eq("/users/#{user.id}")
    expect(page).to have_content("Hello #{user.username.upcase}")
  end

  scenario "user will not login with wrong password" do
    user = create(:user, username: "user", password: "password")

    visit root_path
    click_link "Login"
    fill_in "Username", with: user.username
    fill_in "Password", with: "not password"
    click_button "Login"

    expect(page).to have_content("Invalid. Try Again.")
  end
end
