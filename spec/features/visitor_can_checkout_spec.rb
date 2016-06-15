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

    expect(current_path).to eq('/orders')
    expect(page).to have_content("Order was successfully placed")
    expect(page).to have_content Order.last.id
  end
  scenario "a visitor without an existing account can checkout" do
    # As a visitor when I have items in my cart
    # And when I visit "/cart"
    # I should not see an option to "Checkout"
    # I should see an option to "Login or Create Account to Checkout"
    # After I create an account
    # And I visit "/cart"
    # Then I should see all of the data that was there when I was not logged in
    # When I click "Logout"
    # Then I should see see "Login"
    # And I should not see "Logout"
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
    click_link "Checkout"

    expect(current_path).to eq('/orders')
    expect(page).to have_content("Order was successfully placed")
    expect(page).to have_content Order.last.id
  end
end
