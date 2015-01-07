require "rails_helper"

  feature "User edits a group", %q(
    As an authenticated user
    I want to edit a group
    So that I can invite other users to that group

    Acceptance Criteria
    [ ] Go to groups/edit to fill out form
    [ ] User must enter a new title
    [ ] User must enter a new description

  ) do

  context "authenticated user" do
    let(:user){ FactoryGirl.create(:user) }

    before(:each) do
      visit new_user_session_path
      fill_in "user[email]", with: user.email
      fill_in "user[password]", with: user.password
      click_button "Log in"
    end

    scenario "user successfully edits a group" do

      visit root_path
      click_link "Create a Group"
      fill_in "Title", with: "Car Talk"
      fill_in "Description", with: "lots of cars and junk"

      click_button "Create Group"

      click_link "Edit"
      fill_in "Title", with: "Local Talk"
      fill_in "Description", with: "discussion local stores"
      click_button "Update Group"

      expect(page).to have_content("You've successfully updated the group!")
      expect(page).to have_content("Local Talk")
      expect(page).to have_content("discussion local stores")

    end

    scenario "user unsuccessfully edits a group" do

      visit root_path
      click_link "Create a Group"
      fill_in "Title", with: "Car Talk"
      fill_in "Description", with: "Lots of cars and junk"

      click_button "Create Group"
      expect(page).to have_content("You've successfully created a group!")
      click_link "Edit"
      fill_in "Title", with: ""
      fill_in "Description", with: "discussion local stores"
      click_button "Update Group"

      expect(page).to have_content("")
      expect(page).to have_content("discussion local stores")    end
  end
end
