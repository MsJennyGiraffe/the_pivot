require 'rails_helper'

RSpec.describe Category, type: :model do

  it "can be created using a factory" do
    category = FactoryGirl.build(:category)
    expect(category.title).to match(/Category_\d/)
  end
 

end
