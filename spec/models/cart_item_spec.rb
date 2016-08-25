require 'rails_helper'

RSpec.describe CartItem, type: :model do
  it ".subtotal_price calculated the total price of an item" do
    item = create(:item)
    quantity = 5
    cart_item = CartItem.new(item, quantity)
    total = item.buyout_price * quantity

    expect(cart_item.subtotal).to eq(total)
  end

end
