require 'rails_helper'

RSpec.feature "a visitor can visit different businesses" do
  scenario "a visitor visits a business page" do
      User.create(username: "business_1", password: "password", email: "test@gmail.com", approved: true, role: 1 )
      User.create(username: "business_2", password: "password", email: "test2@gmail.com", approved: true, role: 1 )


        visit root_path
        click_on "Sellers"

        expect(page).to have_content("business_1")

        click_on "business_1"

        expect(page).to have_content("business_1")

        visit root_path

        click_on "Sellers"

        expect(page).to have_content("business_2")

        click_on "business_2"

        expect(page).to have_content("business_2")
  end
end
