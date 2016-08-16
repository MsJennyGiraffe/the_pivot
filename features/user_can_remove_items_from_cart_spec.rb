require 'rails_helper'

RSpec.feature "user can remove an item from the cart" do
  scenario "user can remove an item from the cart" do
    item = FactoryGirl.create(:item)
    visit item_path(item)
    click_link "Add to Cart"
    visit '/cart'
    click_link "Remove"

    expect(page).to have_content("Successfully removed #{item.title} from your cart")
    expect(page).to_not have_content("$#{item.price}")
    expect(page).to_not have_content("#{item.description}")

    click_link "#{item.title}"
    expect(current_path).to eq(item_path(item))
  end
end
