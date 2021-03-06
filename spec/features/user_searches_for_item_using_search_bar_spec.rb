require 'rails_helper'

RSpec.feature "user searches for an item using search bar on homepage", type: :feature do
  scenario "user searches for an item using search bar that matches" do
    item1, item2 = create_list(:item, 3)

    visit root_path

    fill_in "Store Quick Search", with: item1.title
    click_button "Search"
    expect(page).to have_content(item1.title)
  end

  scenario "user searches for an item using search bar that does not match" do
    item1, item2 = create_list(:item, 3)

    visit root_path

    fill_in "Store Quick Search", with: "dfghjklwekljnf"
    click_button "Search"
    expect(page).to have_content("not found")
  end
end
