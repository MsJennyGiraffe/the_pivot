require 'rails_helper'

RSpec.feature "Admin can log in" do

  scenario "exist admin can log in" do
    admin = User.create(username: "admin",
                        email: "admin@admin.com",
                        password: "password",
                        role: 1)

    visit login_path

    fill_in "Username", with: admin.username
    fill_in "Password", with: admin.password

    click_button "Login"

    expect(current_path).to eq(admin_dashboard_path)
  end

  scenario "admin can view existing orders" do
    admin = User.create(username: "admin",
                        email: "admin@admin.com",
                        password: "password",
                        role: 1)

    order = FactoryGirl.create(:order)

    visit login_path

    fill_in "Username", with: admin.username
    fill_in "Password", with: admin.password

    click_button "Login"

    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_content(order.id)
    expect(page).to have_content("View Order")
  end
end
