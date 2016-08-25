require 'rails_helper'

RSpec.feature "guest visits non-existent path" do
  scenario "visit url that doesn't exist" do

    visit "/uerser/werwerw"

    expect(page).to have_content("404")
  end
end
