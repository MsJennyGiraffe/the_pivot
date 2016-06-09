require "rails_helper"


RSpec.feature "user can see featured items on homepage" do
  scenario "when a user lands on the homepage, they see some featured items" do
    item1 = Item.new(title: "Hatchet", price: 10, description: "A small, light axe designed for use in one hand specifically while camping or travelling.", image_path: "http://vignette2.wikia.nocookie.net/fallout/images/7/78/FNVMeleeHatchet.png/revision/latest?cb=20110209091640")
    item2 = Item.new(title: "Bourbon", price: 5, description: "Rye Bourbon from down the street", image_path: "https://img0.etsystatic.com/028/1/7947782/il_570xN.581725526_7vdb.jpg")
    item3 = Item.new(title: "Chicken", price: 3, description: "Farm raised chicken", image_path: "http://www.shauntmax30.com/data/out/8/992046-xandimus-animals-chicken.jpg")
    # items = create_list(:item, 3)

    visit root_path

    within(find_by_id("title")) do
     expect(page.text).to have_content(/Item Title \d/)
    end

    within(find_by_id("price")) do
      expect(page.text).to match(/^\$\d+/)
    end

    within(find_by_id("description")) do
      expect(page.text).to match(/Description \d/)
    end
  end
end
