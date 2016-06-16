require "rails_helper"

RSpec.feature "User can adjust item quantites in cart" do
  scenario "user increases quantity" do
    item = FactoryGirl.create(:item, stock: 10)
    total_price_for_two = item.price * 2
    total_price_for_four = item.price * 4

    visit item_path(item)
    click_link "Add to Cart"

    visit '/cart'

    expect(page).to have_content item.title
    expect(page).to have_content "1"

    click_button ("1")
    click_on "2"

    expect(page).to have_content "2"

    expect(page).to have_content "Total Price: $#{total_price_for_two}"

    click_button ("2")
    click_on "4"

    expect(page).to have_content "4"

    expect(page).to have_content "Total Price: $#{total_price_for_four}"
  end

  scenario "user decreases quantity" do
    item = FactoryGirl.create(:item, stock: 15)

    visit item_path(item)
    click_link "Add to Cart"

    visit '/cart'

    expect(page).to have_content item.title
    expect(page).to have_content "1"

    click_button ("1")
    click_on "10"

    expect(page).to have_content "10"

    click_button ("10")
    click_on "2"

    expect(page).to have_content "2"
  end

  scenario "user selects quantity that is in stock" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    category = Category.create(title: "feet")
    item = Item.create({
      title: "boots",
      price: 3,
      description: "these boots were made for walkin",
      image_path: "sadasca",
      category: category,
      weight: 10,
      stock: 15
    })

    visit item_path(item.id)
    click_link "Add to Cart"

    visit '/cart'
    click_button "1"
    click_link "10"

    click_link "Checkout"

    expect(current_path).to eq(new_order_reservation_path(Order.last))
    expect(page).to have_content("Order was successfully placed")
  end

  scenario "user selects quantity that is in stock" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    category = Category.create(title: "feet")
    item = Item.create({
      title: "boots",
      price: 3,
      description: "these boots were made for walkin",
      image_path: "sadasca",
      category: category,
      weight: 10,
      stock: 5
    })

    visit item_path(item.id)
    click_link "Add to Cart"

    visit '/cart'
    click_button "1"

    within("#butts") do
      expect(page).to have_content("5")
      expect(page).to_not have_content("6")
    end

    click_link "Checkout"

    item = Item.find(item.id)
    expect(item.stock).to eq(4)
  end
end
