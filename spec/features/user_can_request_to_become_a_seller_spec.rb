require "rails_helper"

RSpec.feature "User can request to be a seller" do
  scenario "A user requests seller status" do
    user = create(:user)
    admin = create(:user, role: 2)

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"

    click_on "Apply to Become Seller"

    expect(page).to have_content("Successfully requested to become a seller.")

    click_on "Logout"

    fill_in "Username", with: admin.username
    fill_in "Password", with: admin.password
    click_button "Login"

    visit admin_platform_admin_index_path

    expect(page).to have_content(user.username)
    expect(page).to have_content("Approve")
    expect(page).to have_content("Deny")

    click_on "Approve"

    expect(page).to have_content("Seller approved!")
  
  end
end
