require 'rails_helper'

RSpec.describe Item, type: :model do

  let(:item_instance) { build(:item) }

  it "has a valid factory" do
    expect(item_instance).to be_valid
  end

  context "item should have the correct attributes" do
    it { expect(item_instance).to respond_to(:title) }
    it { expect(item_instance).to respond_to(:price) }
    it { expect(item_instance).to respond_to(:description) }
    it { expect(item_instance).to respond_to(:image_path) }
    it { expect(item_instance).to respond_to(:category) }
  end

  describe "can be created using a factory" do

    it { expect(item_instance.title).to match(/Item Title \d/) }
    it { expect(item_instance.price).to be_between(1, 10) }
    it { expect(item_instance.description).to match(/Description \d/) }
    it { expect(item_instance.image_path).to eq("https://image.freepik.com/free-icon/wagon_318-116334.png") }
    it { expect(item_instance.category.title).to match(/Category_\d/) }
  end

  describe "item validates attributes" do
    it { expect(item_instance).to validate_presence_of(:title) }
    it { expect(item_instance).to validate_presence_of(:price) }
    it { expect(item_instance).to validate_presence_of(:description) }
    it { expect(item_instance).to validate_presence_of(:image_path) }
    it { expect(item_instance).to validate_presence_of(:category) }
  end

  describe "item validates associations" do
  end

  it "has a default stock of zero" do
    item = FactoryGirl.create(:item)
    expect(item.stock).to eq(0)
  end
end
