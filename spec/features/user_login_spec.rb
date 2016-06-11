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
end
