require 'rails_helper'

RSpec.describe Item, type: :model do

  it "can be created using a factory" do
    item = FactoryGirl.build(:item)
    
    expect(item.title).to match(/Item Title \d/)
    expect(item.price).to be_between(1, 10)
    expect(item.description).to match(/Description \d/)
    expect(item.image_path).to eq("https://image.freepik.com/free-icon/wagon_318-116334.png")
    expect(item.category.title).to match(/Category_\d/)
  end
 
end
