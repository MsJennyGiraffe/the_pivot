require 'rails_helper'

RSpec.feature "visitor cannot bid on item" do
  scenario "visitor clicks on bid and cannot bid" do
    user_1 = User.create(username: "business_1", password: "password", email: "test@gmail.com", role: 1, approved: true )
    user_1.items.create!(title: "Pick Axe",
              buyout_price: 15,
              description: "Whether it's dislodging a stuck wheel or extracting gold, a good quality pick axe is a must have on the Oregon Trail. With a solid single wooden handle and cast steel head, durability will not be an issue.",
              image_path: "http://vignette3.wikia.nocookie.net/mafiawars/images/1/14/Huge_item_pickaxe_01.png/revision/latest?cb=20120917074243",
            )
    visit cart_path
    
    expect(page).to have_content("Your cart is currently empty")

    visit sellers_path

    click_on "View Shop"

    expect(current_path).to eq(seller_path(user_1.slug))

    click_on "Bid"

    expect(page).to have_content("Login to Bid")

  end
end
