RSpec.feature "User logs in" do 

  let!(:user) { create(:user) }

  scenario "with valid credentials" do 
    # As a visitor 
    # When I visit "/login
    visit login_path
    # And when I click link "Create Account"
    click_on "Create Account"

    expect(current_path).to eq(new_user_path)

    # And I fill in my desired credentials
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
   
    # And I submit my information
    click_button "Login"

    # Then my current page should be "/dashboard"
    expect(current_path).to eq("/dashboard/#{user.id}")
    # And I should see a message in the navbar that says "Logged in as SOME_USER"
    within("nav navbar-nav navbar-right") do
      expect(page).to have_content("Logged in as #{user.username}")
    end
    
    # And I should see my profile information
    
    within("navbar") do
      expect(page).to have_content("")
    end
    
    expect(page).to_not have_conent("Login")
    expect(page).to_not have_conent("Logout")

  end

  # scenario "with incorrect password" do
  #   pending
  #   user = User.create(username: "brian", password: "password")
  #   visit login_path
  #   fill_in "Username", with: "brian"
  #   fill_in "Password", with: "incorrectpassword"
  #   click_button "Login"

  #   # within("div#flash") do 
  #   #   expect(page).to have_content("Invalid. Try Again.")
  #   # end

  #   within("div#content") do
  #     expect(page).to have_content("Login")
  #   end
  # end

  # scenario "with valid credentials and can logout" do
  #   pending
  #   login_user

  #   within(find_by_id("welcome")) do 
  #     expect(page).to have_content("Welcome, brian!")
  #   end

  #   click_link "Logout"

  #   within("div#flash") do 
  #     expect(page).to have_content("Goodbye!")
  #   end

  #   within("div#content") do
  #     expect(page).to have_content("Login")
  #   end
  # end

  # def login_user
  #   user = User.create(username: "brian", password: "password")

  #   visit login_path
  #   fill_in "Username", with: "brian"
  #   fill_in "Password", with: "password"
  #   click_button "Login"
  # end
  
end
