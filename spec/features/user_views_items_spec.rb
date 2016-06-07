require 'rails_helper'

RSpec.feature "UserViewsItems", type: :feature do
  scenario "user can view all items on item page" do
    item = Item.create(title: "Pick Axe", price: 15, description: "sharp item")
    visit items_path

    expect(page).to have_content "All Items"
    expect(page).to have_content "Pick Axe"
    expect(page).to have_content "15"
    expect(page).to have_content "sharp item"
  end
end
