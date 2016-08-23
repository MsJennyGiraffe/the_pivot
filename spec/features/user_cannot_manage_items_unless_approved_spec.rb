require "rails_helper"

RSpec.feature "user can only manage items if user is approved" do
  scenario "user not approved" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "users/#{user.id}"

    expect(page).to_not have_content("Add Item")

    visit "/#{user.slug}/items/new"

    expect(page).to have_content("404")
  end
end
