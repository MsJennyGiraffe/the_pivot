require 'rails_helper'

RSpec.feature "a user can create a chat room" do
  scenario "a user can start a chat" do
      user_1 = User.create!(username: "business_1", password: "password", email: "test@gmail.com" )

      visit login_path
      fill_in "Username", with: "business_1"
      fill_in "Password", with: "password"
      click_button "Login"

      visit root_path

      expect(page).to have_content("Chat About It!")

      click_on "Chat About It!"

      expect(page).to have_content("New chat room")

      click_on "New chat room"

      expect(page).to have_content("Title")

      fill_in "Title", with: "hello"

      click_on "Add!"

      click_on "hello"

      expect(page).to have_content("Body")
    end
  scenario "a chatroom must have unique name" do
      user_1 = User.create!(username: "business_1", password: "password", email: "test@gmail.com" )

      visit login_path
      fill_in "Username", with: "business_1"
      fill_in "Password", with: "password"
      click_button "Login"

      visit root_path

      expect(page).to have_content("Chat About It!")

      click_on "Chat About It!"

      expect(page).to have_content("New chat room")

      click_on "New chat room"

      expect(page).to have_content("Title")

      fill_in "Title", with: "hello"

      click_on "Add!"

      click_on "New chat room"

      expect(page).to have_content("Title")

      fill_in "Title", with: "hello"

      click_on "Add!"

      expect(page).to have_content("Chat Room must have unique title.")
      expect(current_path).to eq("/chat_rooms")
  end

  scenario "must be logged in to create chat" do
    visit root_path

    click_on "Chat About It!"

    expect(current_path).to eq("/chat_rooms")

    click_on "New chat room"

    fill_in "Title", with: "hello"

    click_on "Add!"

    expect(page).to have_content("Must be logged in to chat")
    expect(current_path).to eq(login_path)
  end
end
