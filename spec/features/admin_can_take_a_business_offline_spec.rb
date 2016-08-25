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
    admin.update_role
    expect(admin.name).to eq("example4")
  end

  scenario "a guest user cannot access platform admin dashboard" do
    visit admin_platform_admin_index_path
    expect(page).to have_content("404")
  end

  scenario "a seller cannot access platform admin dashboard" do
    user = create(:user, role: "seller")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_platform_admin_index_path
    expect(page).to have_content("404")
  end
end
