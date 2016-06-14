require 'rails_helper'

RSpec.feature "user can checkout" do
  scenario "a logged in user can checkout" do
    item = FactoryGirl.create(:item)

    user = FactoryGirl.create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).
      and_return(user)

    visit item_path(item)
    click_link "Add to Cart"

    visit '/cart'

    expect(current_path).to eq("/cart")
    expect(page).to have_content item.title

    click_link "Checkout"

    expect(current_path).to eq('/orders')
    expect(page).to have_content("Order was successfully placed")
    expect(page).to have_content Order.last.id
  end
end
