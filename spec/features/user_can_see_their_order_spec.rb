require 'rails_helper'

RSpec.feature "User can see their order" do
  scenario "user checks out and sees their order" do
    user_1 = User.create(username: "business_1", password: "password", email: "test@gmail.com", role: 1, approved: true )
    user_2 = User.create(username: "business_2", password: "password", email: "test1@gmail.com", role: 1, approved: true )
    user_1.items.create!(title: "Pick Axe",
              buyout_price: 15,
              description: "Whether it's dislodging a stuck wheel or extracting gold, a good quality pick axe is a must have on the Oregon Trail. With a solid single wooden handle and cast steel head, durability will not be an issue.",
              image_path: "http://vignette3.wikia.nocookie.net/mafiawars/images/1/14/Huge_item_pickaxe_01.png/revision/latest?cb=20120917074243",
            )
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)


    visit root_path
    click_on "Sellers"
    click_on "business_1"
    expect(page).to have_content("business_1")
    click_on "Snap it Up"

    visit cart_path

    expect(current_path).to eq(cart_path)

    click_link "Checkout"

    expect(page).to have_content("Order was successfully placed")
    expect(current_path).to eq(order_path(user_1.orders.last))
    expect(page).to have_content(user_1.items.last.title)

    visit orders_path

    expect(page).to have_content(user_1.orders.last.id)

    expect(user_1.orders.last.completed?).to eq(true)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_2)

    visit order_path(user_1.orders.last)

    expect(page).to have_content("404")
  end

  scenario "user checks out and sees their order" do
    user_1 = User.create(username: "business_1", password: "password", email: "test@gmail.com", role: 1, approved: true )
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

    visit cart_path

    click_on "Checkout"

    expect(page).to have_content("Cart Empty")
    expect(current_path).to eq(cart_path)
  end
end
