require 'rails_helper'

RSpec.feature "user searches for an item using search bar" do
  scenario "user searches for an item using search bar" do
    item1, item2 = create_list(:item, 3)
    visit '/'

    fill_in "Search Shop", with: "Pick"

    expect(page).to have_content("Pick Axe")
  end
end
