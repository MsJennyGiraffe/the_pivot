require 'rails_helper'

RSpec.feature "a user can add items to their store" do
  scenario "a registered user adds an item to sell" do

    user_1 = User.create!(username: "business_1", password: "password", email: "test@gmail.com", role: 1, approved: true )
    visit login_path
    fill_in "Username", with: "business_1"
    fill_in "Password", with: "password"
    click_button "Login"

    expect(current_path).to eq(user_path(user_1))

    click_on "Add Item"

    expect(current_path).to eq(new_user_item_path(user_1.slug))

    fill_in "Title", with: "Pogs"
    fill_in "Description", with: "Flip them over and win them!"
    fill_in "Image Path", with: "http://cdn.firstwefeast.com/assets/2016/01/pogs.jpg"
    fill_in "Starting Bid", with: (0.99)
    fill_in "Expiration Time", with: "24 hours"
    click_on "Create Item"


    expect(current_path).to eq(user_item_path(user_slug: user_1.slug, id: user_1.items.last))

    expect(page).to have_content("Item Successfully Added To Your Store")
    expect(page).to have_content("Pogs")
    expect(page).to have_content("Flip them over and win them!")
    expect(page).to have_content("0.99")
  end
end
