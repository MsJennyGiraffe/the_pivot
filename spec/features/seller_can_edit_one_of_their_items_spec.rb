require "rails_helper"

RSpec.feature "User can edit their own items" do
  scenario "A user can edit their item attribues" do
    user = create(:user)
    item = create(:item, user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/users/#{user.id}"
    click_link "#{item.title}"
    click_link "Edit Item"

    expect(current_path).to eq ("/#{user.slug}/items/#{item.id}/edit")

    fill_in "Title", with: "new title"
    click_button "Update Item"

    expect(page).to have_content "new title"
  end
end
