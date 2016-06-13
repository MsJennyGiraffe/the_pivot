# Background: An existing authenticated user with a cart with items
# As a visitor
# When I add items to my cart
# And I visit "/cart"
# And when I click "Checkout"
# Then the order should be placed
# And my current page should be "/orders"
# And I should see a message "Order was successfully placed"
# And I should see the order I just placed in a table
require 'rails_helper'

RSpec.feature "user can checkout" do
  scenario "a logged in user can checkout" do
    item = FactoryGirl.create(:item)

    visit item_path(item)
    click_link "Add to cart"

    visit '/cart'

    expect(current_path).to eq("/cart")
    expect(page).to have_content item.title

    click_link "Checkout"

    expect(current_path).to eq('/orders')
    exoect(page).to have_content("Order was successfully placed")
    expect(page).to have_content(item.title)
    # (expect orders to be a table)
    (probably expect a reservation time)
  end

end
