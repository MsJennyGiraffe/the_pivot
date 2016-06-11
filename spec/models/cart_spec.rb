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
end
