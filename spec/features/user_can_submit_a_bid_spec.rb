require 'rails_helper'

RSpec.feature "a user can submit a bid" do
  scenario "a registered user bids on an item" do
      user_1 = User.create!(username: "business_1", password: "password", email: "test@gmail.com" )
      user_2 = User.create!(username: "business_2", password: "password", email: "test1@gmail.com" )
      item = create(:item)
      user_2.items << item

      visit login_path
      fill_in "Username", with: "business_1"
      fill_in "Password", with: "password"
      click_button "Login"

      visit item_path(item)

      fill_in :starting_bid, with: "#{item.starting_bid - 1}"
      click_on "Place Bid"

      expect(page).to have_content("Must make a bid that is higher than current bid.")

      fill_in :starting_bid, with: "#{item.starting_bid + 1}"
      click_on "Place Bid"

      expect(current_path).to eq(item_path(item))

      expect(page).to have_content("#{item.starting_bid + 1}")
      expect(user_1.bids.last.price).to eq(item.starting_bid + 1)
  end
end
