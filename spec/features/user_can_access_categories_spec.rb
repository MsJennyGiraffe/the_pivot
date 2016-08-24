require 'rails_helper'

RSpec.feature "a user can access categories" do
  scenario "a guest user can see categories" do
    category_one, category_two = create_list(:category, 2)
    seller = create(:user, role: 1, approved: true)
    item_one = create(:item, category: category_one, user: seller)

    visit '/'

    expect(page).to have_content(category_one.title)
    expect(page).to have_content(category_two.title)

    click_link category_one.title

    expect(page).to have_content(item_one.title)
  end
end
