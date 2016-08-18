require 'rails_helper'

RSpec.feature "a user can view order history" do
  scenario "can view order history" do

    user_1 = User.create!(username: "business_1", password: "password", email: "test@gmail.com" )
    user_1.orders.create(status: "completed")
    visit login_path
    fill_in "Username", with: "business_1"
    fill_in "Password", with: "password"
    click_button "Login"


    visit orders_path
    expect(page).to have_content("Order Number 1")

  end
end
