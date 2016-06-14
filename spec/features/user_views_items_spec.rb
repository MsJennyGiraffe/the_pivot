require 'rails_helper'

RSpec.feature "UserViewsItems", type: :feature do

  let!(:item_instance) { create(:item) }
  scenario "user can view all items on item page" do

    visit items_path

    within(find_by_id("title")) do
     expect(page.text).to have_content(/Item Title \d/)
    end

    within(find_by_id("price")) do
      expect(page.text).to match(/^Price: \$\d+/)
    end

    within(find_by_id("description")) do
      expect(page.text).to match(/Description \d/)
    end
  end
end
