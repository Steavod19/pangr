require "rails_helper"

feature "User Submits a new group", %q(
  As an authenticated user
  I want to submit a group
  So that I can invite other users to that group

  Acceptance Criteria
  [ ] Go to groups/new to fill out form
  [ ] User must enter title
  [ ] User must enter description

  ) do

  context "authenticated user" do
    let(:user){ FactoryGirl.create(:user) }

    before(:each) do
      sign_in_as(group.user)
    end

    scenario "user successfully submits a group" do

      visit new_group_path
      fill_in "Title", with: "Car Talk"
      fill_in "Description", with: "lots of cars and junk"

      click_button "Create Group"
      expect(page).to have_content("You've successfully created a group!")
      expect(page).to have_content("Car Talk")
      expect(page).to have_content("lots of cars and junk")

      click_link "Pangr"
      expect(page).to have_content("Car Talk")
    end

    scenario "user unsuccessfully submits a group" do

      visit root_path
      click_link "Create a Group"
      fill_in "Title", with: ""
      fill_in "Description", with: "this is the group description"

      click_button "Create Group"
      expect(page).to have_content("You've failed to created a group!")
    end
  end
end
