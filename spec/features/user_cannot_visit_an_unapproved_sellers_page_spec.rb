require "rails_helper"

RSpec.feature "visitor cannot view business if that business isn't approved" do
  scenario "cannot visit default user page" do
    user_1 = User.create!(username: "business_1", password: "password", email: "test@gmail.com", approved: false, role: 0 )

    visit "/business_1"

    expect(page).to have_content("404")
  end
end
