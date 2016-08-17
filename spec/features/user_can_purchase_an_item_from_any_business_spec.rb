require 'rails_helper'

RSpec.feature "a user can purchase items from multiple businesses" do
  scenario "a user buys itmes from two businesses" do
      user_1 = User.create(username: "business_1", password: "password", email: "test@gmail.com" )
      user_1.items.create!(title: "Pick Axe",
                buyout_price: 15,
                description: "Whether it's dislodging a stuck wheel or extracting gold, a good quality pick axe is a must have on the Oregon Trail. With a solid single wooden handle and cast steel head, durability will not be an issue.",
                image_path: "http://vignette3.wikia.nocookie.net/mafiawars/images/1/14/Huge_item_pickaxe_01.png/revision/latest?cb=20120917074243",
              )
      user_2 = User.create(username: "business_2", password: "password", email: "test1@gmail.com" )
      user_2.items.create!(title: "Pick Axe 2",
                buyout_price: 15,
                description: "Whether it's dislodging a stuck wheel or extracting gold, a good quality pick axe is a must have on the Oregon Trail. With a solid single wooden handle and cast steel head, durability will not be an issue.",
                image_path: "http://vignette3.wikia.nocookie.net/mafiawars/images/1/14/Huge_item_pickaxe_01.png/revision/latest?cb=20120917074243",
              )
      visit root_path
      click_on "View all sellers"
      click_on "business_1"
      expect(page).to have_content("business_1")
      click_on "Add to cart"

      visit cart_path

      expect(current_path).to eq(cart_path)

      click_link "Checkout"

      visit root_path
      click_on "View all sellers"
      click_on "business_2"
      expect(page).to have_content("business_2")
      click_on "Add to cart"

      visit cart_path

      expect(current_path).to eq(cart_path)

      click_link "Checkout"

  end
end
