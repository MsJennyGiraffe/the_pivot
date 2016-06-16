require 'rails_helper'

RSpec.feature "user can checkout" do
  scenario "a visitor with an account can checkout" do
    item = FactoryGirl.create(:item)
    user = FactoryGirl.create(:user)

    visit item_path(item)
    click_link "Add to Cart"

    visit cart_path

    expect(page).to have_content(item.title)

    click_link "Login or Register to Checkout"

    expect(current_path).to eq(login_path)

    fill_in "Username", with: user.username
    fill_in "Password", with: user.password

    click_button "Login"

    expect(current_path).to eq(cart_path)

    click_link "Checkout"

    expect(current_path).to eq(new_order_reservation_path(Order.last))
    expect(page).to have_content("Order was successfully placed")
  end
  scenario "a visitor without an existing account can checkout" do
    item = FactoryGirl.create(:item)
    user = FactoryGirl.create(:user)
    visit item_path(item)
    click_link "Add to Cart"
    visit cart_path

    expect(page).to have_content(item.title)
    expect(page).to have_content("Login or Register to Checkout")

    click_link "Login or Register to Checkout"

    expect(current_path).to eq(login_path)

    click_link "Create Account"
    fill_in "Username", with: user.username
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Create Account"

    expect(current_path).to eq(cart_path)
    expect(page).to have_content(item.title)

    click_link "Checkout"

    expect(current_path).to eq(new_order_reservation_path(Order.last))
    expect(page).to have_content("Order was successfully placed")
    expect(page).to_not have_content("Login")

    click_link "Logout"

    expect(page).to have_content("Login")
    expect(page).to_not have_content("Logout")
  end
end
