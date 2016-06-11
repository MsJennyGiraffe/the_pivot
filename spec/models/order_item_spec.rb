require 'rails_helper'

RSpec.describe OrderItem, type: :model do

  let(:order_item_instance) { build(:order_item) }

  it "has a valid factory" do
    expect(order_item_instance).to be_valid
  end
 
  describe "has correct attributes" do
    it { expect(order_item_instance).to respond_to(:order) }
    it { expect(order_item_instance).to respond_to(:item) }
  end

  describe "category validates associations" do
    it { expect(order_item_instance).to belong_to(:order) }
    it { expect(order_item_instance).to belong_to(:item) }
  end

  describe "item validates attributes" do 
    it { expect(order_item_instance).to validate_presence_of(:order) }
    it { expect(order_item_instance).to validate_presence_of(:item) }
  end
end
