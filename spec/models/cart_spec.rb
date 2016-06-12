require 'rails_helper'

RSpec.describe Cart, type: :model do
  it "it has intital contents" do
    cart = Cart.new("1" => 1)
    contents = { "1" => 1 }

    expect(contents).to eq(cart.contents)
  end

  it "can add an item" do
    cart = Cart.new("1" => 1)
    cart.add_item(1)
    cart.add_item(2)
    contents = { "1" => 2, "2" => 1 }

    expect(contents).to eq(cart.contents)
  end

  it "returns total number of items added to cart" do
    cart = Cart.new("1" => 3, "2" => 1, "3" => 3)

    expect(7).to eq(cart.total)
  end

  it ".total_price returns the total value of a cart" do
    item1 = FactoryGirl.create(:item)
    item2 = FactoryGirl.create(:item)
    item1_id = item1.id
    item2_id = item2.id
    quantity1 = 2
    quantity2 = 3
    initial_contents = { item1_id => quantity1, item2_id => quantity2}
    cart = Cart.new(initial_contents)
    total = (item1.price * quantity1) + (item2.price * quantity2)

    expect(cart.total_price).to eq(total)
  end

  it ".total_price returns the total weight of a cart" do
    item1 = FactoryGirl.create(:item)
    item2 = FactoryGirl.create(:item)
    item1_id = item1.id
    item2_id = item2.id
    quantity1 = 2
    quantity2 = 3
    initial_contents = { item1_id => quantity1, item2_id => quantity2}
    cart = Cart.new(initial_contents)
    total = (item1.weight * quantity1) + (item2.weight * quantity2)

    expect(cart.total_weight).to eq(total)
  end
end
