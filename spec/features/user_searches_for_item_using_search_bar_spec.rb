require 'rails_helper'

RSpec.feature "user searches for an item using search bar on homepage", type: :feature do
  scenario "user searches for an item using search bar" do
    item1, item2 = create_list(:item, 3)

    visit root_path


    fill_in "Shop Search", with: item1.title
    click_button "Search"
    expect(page.text).to match(/Item Title \d/)
  end
end
