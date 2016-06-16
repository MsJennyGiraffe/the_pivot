require 'rails_helper'

RSpec.feature "admin can change order status" do
  scenario "changes status to cancelled" do
    admin = create(:user, role: 1)
    item = create(:item)
    order = create(:order, status: "completed", user_id: admin.id)
    reservation = create(:reservation, order: order)
    order_items = OrderItem.create(item_id: item.id, order_id: order.id, quantity: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_order_path(order)

    select "cancelled", :from => :order_status
    click_button "Change Status"
    expect(current_path).to eq(admin_order_path(order))
    expect(page).to have_content("Current Status: cancelled")
    expect(page).to have_content("Status has been successfully changed to cancelled")
  end

  scenario "change status to completed" do
    admin = create(:user, role: 1)
    item = create(:item)
    order = create(:order, status: "picked up", user_id: admin.id)
    reservation = create(:reservation, order: order)
    order_items = OrderItem.create(item_id: item.id, order_id: order.id, quantity: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_order_path(order)

    select "completed", :from => :order_status
    click_button "Change Status"
    expect(current_path).to eq(admin_order_path(order))
    expect(page).to have_content("Current Status: completed")
    expect(page).to have_content("Status has been successfully changed to completed")
  end

  scenario "change status to picked up" do
    admin = create(:user, role: 1)
    item = create(:item)
    order = create(:order, status: "completed", user_id: admin.id)
    reservation = create(:reservation, order: order)
    order_items = OrderItem.create(item_id: item.id, order_id: order.id, quantity: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_order_path(order)

    select "picked up", :from => :order_status
    click_button "Change Status"
    expect(current_path).to eq(admin_order_path(order))
    expect(page).to have_content("Current Status: picked up")
    expect(page).to have_content("Status has been successfully changed to picked up")
  end
end
