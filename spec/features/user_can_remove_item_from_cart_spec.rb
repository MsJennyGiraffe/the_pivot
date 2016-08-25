require 'rails_helper'

RSpec.feature "a user remove item from cart" do
  scenario "a user clicks on remove item and item is deleted from cart" do
      user_1 = User.create(username: "business_1", password: "password", email: "test@gmail.com", role: 1, approved: true )
      user_1.items.create!(title: "Pick Axe",
                buyout_price: 15,
                description: "Whether it's dislodging a stuck wheel or extracting gold, a good quality pick axe is a must have on the Oregon Trail. With a solid single wooden handle and cast steel head, durability will not be an issue.",
                image_path: "http://vignette3.wikia.nocookie.net/mafiawars/images/1/14/Huge_item_pickaxe_01.png/revision/latest?cb=20120917074243",
              )
      user_2 = User.create(username: "business_2", password: "password", email: "test1@gmail.com", role: 1, approved: true )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_2)

      visit user_path(user_1)

      expect(page).to have_content("404")

      visit root_path
      click_on "Sellers"
      click_on "business_1"
      expect(page).to have_content("business_1")
      click_on "Snap it Up"

      visit cart_path

      click_on "1"
      click_on "Remove"

      expect(page).to have_content("Successfully removed Pick Axe from your cart")
  end
end
