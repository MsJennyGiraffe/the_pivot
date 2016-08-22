require 'rails_helper'

RSpec.feature "Platform admin can do business admin" do
  scenario "delete an item" do
    user = create(:user)
    admin = create(:user, role: 2)
    item = create(:item, user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit  user_item_path(user_slug: user.slug, id: item)

    expect(page).to have_content(item.title)
    expect(page).to have_content("Delete Item")

    click_on "Delete Item"

    expect(page).to_not have_content(item.title)
  end

  scenario "edit an item" do
    user = create(:user)
    admin = create(:user, role: 2)
    item = create(:item, user_id: user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit  user_item_path(user_slug: user.slug, id: item)

    click_link "Edit Item"

    expect(current_path).to eq ("/#{user.slug}/items/#{item.id}/edit")

    fill_in "Title", with: "new title"
    click_button "Update Item"

    expect(page).to have_content "new title"
  end

  scenario "add an item" do
    user = create(:user)
    admin = create(:user, role: 2)
    item = create(:item, user_id: user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit user_path(user)

    expect(current_path).to eq(user_path(user))

    click_on "Add Item"

    expect(current_path).to eq(new_user_item_path(user.slug))

    fill_in "Title", with: "Pogs"
    fill_in "Description", with: "Flip them over and win them!"
    fill_in "Image Path", with: "http://cdn.firstwefeast.com/assets/2016/01/pogs.jpg"
    fill_in "Starting Bid", with: (0.99)
    fill_in "Expiration Time", with: "24 hours"
    click_on "Create Item"


    expect(current_path).to eq(user_item_path(user_slug: user.slug, id: user.items.last))

    expect(page).to have_content("Item Successfully Added To Your Store")
    expect(page).to have_content("Pogs")
    expect(page).to have_content("Flip them over and win them!")
    expect(page).to have_content("0.99")
  end
end
