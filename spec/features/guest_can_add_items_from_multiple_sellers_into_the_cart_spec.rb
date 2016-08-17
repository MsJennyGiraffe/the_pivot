require 'rails_helper'

RSpec.feature "add items from multiple sellers into cart" do
  scenario "cart from multi sellers" do

      user_1 = User.create!(username: "business_1", password: "password", email: "test@gmail.com" )

      category = create(:category)
      create(:item, user: user_1, category: category)
      # When I visit "/:business_1",

      visit  "/business_1"
      click_on "Add to cart"

      user_2 = User.create!(username: "business_2", password: "password", email: "mack@gmail.com" )
      # When I visit "/:business_2",
      category2 = create(:category)
      create(:item, user: user_2, category: category2)
      visit  "/business_2"
      click_on "Add to cart"
      visit "/cart"
      expect(page).to have_content(user_1.items[0].title)
      expect(page).to have_content(user_2.items[0].title)
  end
end
