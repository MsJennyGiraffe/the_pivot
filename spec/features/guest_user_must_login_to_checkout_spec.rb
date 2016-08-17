require 'rails_helper'

RSpec.feature "Checkout" do
  scenario "user must be loggin in to bid" do
    item = create(:item)

    visit "/items"
    click_link "#{item.title}"
    fill_in :bid, with: ( item.starting_bid + 1 )
    click_link "Bid"

    # expect(current_path).eq("#{item.username}/#{item.title}")
    expect(page).to have_content ("Login to Bid")
  end

  scenario "user must be loggin in to buyout" do
    item = create(:item)

    visit "/items"
    click_link "#{item.title}"
    click_link "Snap it Up"

    # expect(current_path).eq("#{item.username}/#{item.title}")
    expect(page).to have_content ("Login to Buyout")
  end
end
