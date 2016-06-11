require 'rails_helper'

RSpec.describe Order, type: :model do

  let(:order_instance) { build(:order) }

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
end
