require 'rails_helper'

RSpec.feature "user views items by category", type: :feature do
  scenario "user can view a list of all categories" do

    item1, item2 = create_list(:item, 3)
    category_path = "/" + item1.category.title

    visit category_path

    save_and_open_page

    expect(page).to have_content(item1.title)

  end
end
