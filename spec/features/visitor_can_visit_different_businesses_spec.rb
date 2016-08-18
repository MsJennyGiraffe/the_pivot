require 'rails_helper'

RSpec.feature "a visitor can visit different businesses" do
  scenario "a visitor visits a business page" do
      User.create(username: "business_1", password: "password", email: "test@gmail.com" )
      User.create(username: "business_2", password: "password", email: "test2@gmail.com" )


        visit root_path
        click_on "View all sellers"

        expect(page).to have_content("business_1")

        click_on "business_1"

        expect(page).to have_content("business_1")

        visit root_path

        click_on "View all sellers"

        expect(page).to have_content("business_2")

        click_on "business_2"

        expect(page).to have_content("business_2")
  end
end
