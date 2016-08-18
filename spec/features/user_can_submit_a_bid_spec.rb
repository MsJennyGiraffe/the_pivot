require 'rails_helper'

RSpec.feature "a user can submit a bid" do
  scenario "a registered user bids on an item" do
      user_1 = User.create!(username: "business_1", password: "password", email: "test@gmail.com" )
      user_2 = User.create!(username: "business_2", password: "password", email: "test@gmail.com" )
      item = create(:item)
      user_2.items << item

      visit login_path
      fill_in "Username", with: "business_1"
      fill_in "Password", with: "password"
      click_button "Login"

      visit user_item_path(user_slug: user_2.slug, id: user_2.items.last.id)
      expect(current_path).to eq(user_item_path(user_slug: user_2.slug, id: user_2.items.last.id))

      fill_in "bid", with: "#{item.starting_bid + 1}"
      click_on "Place Bid"

      expect(current_path).to eq(user_item_path(user_slug: user_2.slug, id: user_2.items.last.id))

      expect(page).to have_content("#{item.starting_bid + 1}")

  end
end
