require "rails_helper"


RSpec.feature "user can see featured items on homepage" do
  scenario "when a user lands on the homepage, they see some featured items" do
    create(:item)

    visit root_path

    within(find_by_id("title")) do
     expect(page.text).to have_content(/Item Title \d/)
    end

    within(find_by_id("price")) do
      expect(page.text).to match(/^Price: \$\d+/)
    end
  end
end
