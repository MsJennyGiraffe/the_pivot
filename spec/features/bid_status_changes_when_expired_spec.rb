require 'rails_helper'

RSpec.feature "an item bid status can change" do
  scenario "when time expires, an item's bid status changes to expired" do
      user_1 = User.create!(username: "business_1", password: "password", email: "test@gmail.com" )
      item = create(:item)
      user_1.items << item

      visit login_path
      fill_in "Username", with: "business_1"
      fill_in "Password", with: "password"
      click_button "Login"

      expect(item.bid_status).to eq("Open")

      item.update_attribute(:expiration_time, (Time.now - 1.hour))

      expect(item.bid_status).to eq("Closed")
  end
end
