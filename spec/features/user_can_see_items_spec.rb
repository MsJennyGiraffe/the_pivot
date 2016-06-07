require 'rails_helper'

RSpec.feature "user can navagate to see an items show page" do
  scenario "a user can click on an existing item to see details" do
    item = FactoryGirl.create(:item)

    visit root_path
    click_link "Items"
    click_link "#{item.title}"

    expect(current_path).to eq(item_path(item))
    expect(page).to have_content("#{item.title}")
    expect(page).to have_content("#{item.description}")
    expect(page).to have_content("#{item.price}")
  end
end
