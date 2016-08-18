require 'rails_helper'

RSpec.feature "user views items by category", type: :feature do
  scenario "user can view a list of all categories" do

    items = create_list(:item, 3)
    visit categories_path

    items.each do |item|
      expect(page).to have_content(item.category.title)
    end

  end

  scenario "user can view a list of items for a specific category" do
    item1, item2 = create_list(:item, 3)
    category_path = "/" + item1.category.title

    visit category_path

    expect(page).to have_content(item1.title)

  end
end
