require 'rails_helper'

RSpec.feature "an admin can create a new item" do
  scenario "an admin can create a new item" do
    admin = FactoryGirl.create(:user, role: 1)
    category = create(:category)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_item_path
    fill_in "Title", with: "Bob Marley"
    fill_in "Price", with: 1000
    fill_in "Description", with: "I shot the sherrif"
    fill_in "Image path", with: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    select category.title, :from => :item_category_id
    fill_in "Weight", with: 185
    fill_in "Stock", with: 1

    click_button "Create Item"

    expect(current_path).to eq(items_path)
    expect(page).to have_content("Bob Marley")
  end
end
