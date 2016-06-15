require 'rails_helper'

RSpec.feature "User logs in" do

  let(:user) { build(:user) }

  scenario "with valid credentials" do
    visit root_path

    click_link "Sign Up"

    fill_in "Username", with: user.username
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Create Account"

    expect(current_path).to eq("/dashboard")

    within("nav") do
      expect(page).to have_content("Logged in as #{user.username}")
      expect(page).to_not have_content("Login")
      expect(page).to have_content("Logout")
    end

    within("div#content") do
      expect(page).to have_content("Welcome, #{user.username}")
      expect(page).to have_content(user.username)
      expect(page).to have_content(user.email)
    end
  end

  scenario "user can logout" do
    visit root_path

    click_link "Sign Up"

    fill_in "Username", with: user.username
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Create Account"

    expect(current_path).to eq("/dashboard")

    within("nav") do
      expect(page).to have_content("Logged in as #{user.username}")
      expect(page).to_not have_content("Login")
      expect(page).to have_content("Logout")
    end

    click_link "Logout"

    expect(current_path).to eq("/login")
  end

  scenario "existing user can login" do
    login_user

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Logged in as user")
  end

  def login_user
    user = User.create(username: "user",
                       email: "email@example.com",
                       password: "password")

    expect(user).to be_valid

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Login"
  end
end
