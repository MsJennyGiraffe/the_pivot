require 'rails_helper'

RSpec.feature "user can checkout" do
  let(:item) { create(:item) }
  let(:order) { create(:order) }
  let(:user) { create(:user) }

  scenario "user does not see reservation times taken" do
    existing_order_time1 = DateTime.now.beginning_of_day + 12.hour + 1.day
    existing_order_time2 = DateTime.now.beginning_of_day + 13.hour + 1.day
    existing_order_time3 = DateTime.now.beginning_of_day + 14.hour + 1.day

    formatted_existing_order_time1 = 
      existing_order_time1.strftime("%b %e, %I:%M %p")
    formatted_existing_order_time2 = 
      existing_order_time2.strftime("%b %e, %I:%M %p")
    formatted_existing_order_time3 = 
      existing_order_time3.strftime("%b %e, %I:%M %p")

    reservation1 = Reservation.create(pickup_time: existing_order_time1,
                                      order: order)
    reservation2 = Reservation.create(pickup_time: existing_order_time2, 
                                      order: order)

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

    within "#reservation_pickup_time" do
      expect(page).to_not have_content(formatted_existing_order_time1)
      expect(page).to_not have_content(formatted_existing_order_time2)
      expect(page).to have_content(formatted_existing_order_time3)
    end

    start_time = DateTime.now.beginning_of_day + 10.hour + 1.day
    time_to_select = start_time.strftime("%b %e, %I:%M %p")

    select(time_to_select, from: "reservation_pickup_time")

    click_button "Make Reservation"

    expect(current_path).to eq(order_path(Order.last))
    expect(page).to have_content Order.last.id
  end
end
