require 'rails_helper'

RSpec.describe Category, type: :model do

  let(:category_instance) { build(:category) }

  it "has a valid factory" do
    expect(category_instance).to be_valid
  end

  describe "category should have the correct attributes" do
    it { should respond_to(:title) }
    it { expect(category_instance.title).to match(/Category_\d/) }
  end

  describe "category validates attributes" do 
    it { expect(category_instance).to validate_presence_of(:title) }
  end

  describe "category validates associations" do
    it { expect(category_instance).to have_many(:items) }
  end

end
