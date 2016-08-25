require 'rails_helper'

RSpec.describe Item, type: :model do

  let(:item_instance) { build(:item) }

  it "has a valid factory" do
    expect(item_instance).to be_valid
  end

  context "item should have the correct attributes" do
    it { expect(item_instance).to respond_to(:title) }
    it { expect(item_instance).to respond_to(:buyout_price) }
    it { expect(item_instance).to respond_to(:description) }
    it { expect(item_instance).to respond_to(:image_path) }
    it { expect(item_instance).to respond_to(:category) }
    it { expect(item_instance).to respond_to(:starting_bid) }
    it { expect(item_instance).to respond_to(:expiration_time) }
    it { expect(item_instance).to respond_to(:user) }
    it { expect(item_instance).to respond_to(:bid_status) }
    it { expect(item_instance).to respond_to(:active) }
  end

  describe "item validates attributes" do
    it { expect(item_instance).to validate_presence_of(:title) }
    it { expect(item_instance).to validate_presence_of(:description) }
    it { expect(item_instance).to validate_presence_of(:image_path) }
  end

  describe "item validates associations" do
    it { expect(item_instance).to have_many(:bids) }
    it { expect(item_instance).to belong_to(:user) }
    it { expect(item_instance).to belong_to(:category) }
  end

  it "item can check bid status" do
    user_1 = User.create(username: "business_1", password: "password", email: "test@gmail.com", role: 1, approved: true )
    user_2 = User.create(username: "business_2", password: "password", email: "test1@gmail.com", role: 1, approved: true )
    user_1.items.create!(title: "Pick Axe",
              buyout_price: 15,
              description: "Whether it's dislodging a stuck wheel or extracting gold, a good quality pick axe is a must have on the Oregon Trail. With a solid single wooden handle and cast steel head, durability will not be an issue.",
              image_path: "http://vignette3.wikia.nocookie.net/mafiawars/images/1/14/Huge_item_pickaxe_01.png/revision/latest?cb=20120917074243",
            )
    item = user_1.items.first
    


    expect(item.check_bid_status).to eq(nil)
    expect(item.active).to eq(true)
  end

end
