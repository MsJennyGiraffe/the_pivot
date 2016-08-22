require 'rails_helper'

RSpec.feature "Business admin can delete and item" do
  scenario "delete an item" do
    user = create(:user, role: 2)
    item = create(:item, user_id: user.id)
    #     As a business admin,
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    # And I visit /business_1,
    visit  user_item_path(user_slug: user.slug, id: item)
    # And I click on delete item,
    click_on "Delete Item"

    # I expect current_path to be "/business"
    expect(page).to have_content("Item has been removed")
    expect(current_path).to eq(user_path(user))
    # I expect page to not have that item
    expect(page).not_to have_content(item.title)

  end
end
