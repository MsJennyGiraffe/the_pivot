require "rails_helper"

RSpec.feature "User can adjust item quantites in cart" do
  scenario "user increases quantity" do
    item = FactoryGirl.create(:item)
    total_price_for_two = item.price * 2
    total_price_for_four = item.price * 4

    visit item_path(item)
    click_link "Add to Cart"

    visit '/cart'

    expect(current_path).to eq("/cart")
    expect(page).to have_content item.title
    expect(page).to have_content "1"

    click_button ("1")
    click_on "2"

    expect(page).to have_content "2"

    expect(page).to have_content "Total Price: $#{total_price_for_two}"

    click_button ("2")
    click_on "4"

    expect(page).to have_content "4"

    expect(page).to have_content "Total Price: $#{total_price_for_four}"

  end

  scenario "user decreases quantity" do
    item = FactoryGirl.create(:item)

    visit item_path(item)
    click_link "Add to Cart"

    visit '/cart'

    expect(current_path).to eq("/cart")
    expect(page).to have_content item.title
    expect(page).to have_content "1"

    click_button ("1")
    click_on "10"

    expect(page).to have_content "10"

    click_button ("10")
    click_on "2"

    expect(page).to have_content "2"
  end
end
