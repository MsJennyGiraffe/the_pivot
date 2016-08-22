require 'rails_helper'

RSpec.feature "Admin can take a business offline" do
  scenario "take a business offline" do
    user = create(:user, approved: true, role: 1)
    admin = create(:user, role: 2)

    visit login_path
    fill_in "Username", with: admin.username
    fill_in "Password", with: admin.password
    click_button "Login"
    visit admin_platform_admin_index_path
    expect(page).to have_content("Active Businesses")
    expect(page).to have_content("#{user.username} Take Offline")

    click_on "Take Offline"

    expect(page).to have_content("Inactive")
    expect(page).to have_content("#{user.username} Take Online")

    first(:link, "Take Online").click

    expect(page).to have_content("#{user.username} Take Offline")

  end
end
