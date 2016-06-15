require 'rails_helper'

RSpec.feature "user can checkout" do
  scenario "a logged in user can checkout" do
    item = FactoryGirl.create(:item)

    user = FactoryGirl.create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).
      and_return(user)

    visit item_path(item)
    click_link "Add to Cart"

    visit cart_path

    expect(page).to have_content item.title

    click_link "Checkout"

    expect(current_path).to eq(new_order_reservation_path(Order.last))
    expect(page).to have_content("Order was successfully placed")
    expect(page).to have_content("Select a Pick Up Time")
    expect(page).to have_content("Pick Up Hours:")

    select("2016", :from => "reservation_pickup_time_1i")
    select("June", :from => "reservation_pickup_time_2i")
    select("15", :from => "reservation_pickup_time_3i")

    click_button "Make Reservation"

    expect(current_path).to eq(order_path(Order.last))
    expect(page).to have_content Order.last.id
  end
end
