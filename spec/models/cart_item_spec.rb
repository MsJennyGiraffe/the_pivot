require 'rails_helper'

RSpec.describe CartItem, type: :model do
  it ".subtotal_price calculated the total price of an item" do
    item = FactoryGirl.create(:item)
    quantity = 5
    cart_item = CartItem.new(item, quantity)
    total = item.price * quantity

    expect(cart_item.subtotal_price).to eq(total)
  end

  it ".subtotal_price calculated the total weight of an item" do
    item = FactoryGirl.create(:item)
    quantity = 5
    cart_item = CartItem.new(item, quantity)
    total = item.weight * quantity

    expect(cart_item.subtotal_weight).to eq(total)
  end
end
