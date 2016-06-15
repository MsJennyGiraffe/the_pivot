require 'rails_helper'

RSpec.feature "User can add an item to their cart" do
  scenario "user adds items to their carts" do
    item = FactoryGirl.create(:item)
    item2 = FactoryGirl.create(:item)
    total_price = item.price + item2.price
    total_weight = item.weight + item2.weight

    visit item_path(item)
    click_link "Add to Cart"
    expect(current_path).to eq(item_path(item))
    expect(page).to have_content "#{item.title} has been added to cart."
    expect(current_path).to eq(item_path(item))
    visit item_path(item2)

    click_link "Add to Cart"
    expect(page).to have_content "#{item2.title} has been added to cart."

    click_link "View Cart"

    expect(current_path).to eq("/cart")
    expect(page).to have_content("#{item.title}")
    expect(page).to have_content("#{item.price}")
    expect(page).to have_content("#{item.weight}")
    expect(page).to have_content("Total Price: $#{total_price}")
    expect(page).to have_content("Weight Total: #{total_weight} lbs")
  end
end
