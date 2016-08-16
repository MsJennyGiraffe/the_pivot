require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order_instance) { build(:order_with_items) }

  it "has a valid factory" do
    expect(order_instance).to be_valid
  end

  describe "order should have the correct attributes" do
    it { should respond_to(:user) }
    it { should respond_to(:status) }
    it { should respond_to(:items) }
    it { should respond_to(:order_items) }
  end

  describe "order has correct associations" do
    it { expect(order_instance).to belong_to(:user) }
    it { expect(order_instance).to have_many(:order_items) }
    it { expect(order_instance).to have_many(:items) }
  end

  describe "order validates attributes" do
    it { expect(order_instance).to validate_presence_of(:status) }
    it { expect(order_instance).to validate_presence_of(:user) }
  end

  it "correct order is created from cart items" do
    user = FactoryGirl.create(:user)
    item = FactoryGirl.create(:item)

    expect(item).to be_valid
    expect(user).to be_valid

    cart = Cart.new({ item.id.to_s => 1 })

    expect(cart.contents).to eq( { item.id.to_s => 1  })

    order = Order.from_cart(cart, user: user)
    order.update_attribute(:status, "completed")
    order.save
    expect(order.user).to eq(user)
    expect(order.order_items.length).to eq(1)
    expect(order.items.last).to eq(item)
  end
end
