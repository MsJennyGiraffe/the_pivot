require 'rails_helper'

RSpec.describe Bid, type: :model do
  let(:bid_instance) { build(:bid) }

  it "has a valid factory" do
    expect(bid_instance).to be_valid
  end

  describe "order should have the correct attributes" do
    it { should respond_to(:user) }
    it { should respond_to(:item) }
    it { should respond_to(:price) }
  end

  describe "order has correct associations" do
    it { expect(bid_instance).to belong_to(:user) }
    it { expect(bid_instance).to belong_to(:item) }
  end

  describe "order validates attributes" do
    it { expect(bid_instance).to validate_presence_of(:price) }
  end
end
