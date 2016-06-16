require 'rails_helper'

RSpec.feature "user can checkout" do
  let(:item) { create(:item) }
  let(:order) { create(:order) }
  let(:user) { create(:user) }

  scenario "a logged in user can checkout" do

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

    start_time = DateTime.now.beginning_of_day + 10.hour + 1.day
    time_to_select = (start_time).strftime("%b %e, %I:%M %p")

    select(time_to_select, from: "reservation_pickup_time")

    click_button "Make Reservation"

    expect(current_path).to eq(order_path(Order.last))
    expect(page).to have_content Order.last.id
  end
end
