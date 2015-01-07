  require "rails_helper"

  feature "User deletes a group", %q(
    As an authenticated user
    I want to delete a group
    So that I can delete the group

    Acceptance Criteria
    [ ] Go to groups/group[:id]
    [ ] User must delete group

    ) do

  context "authenticated user" do
    let(:user){ FactoryGirl.create(:user) }

    before(:each) do
      visit new_user_session_path
      fill_in "user[email]", with: user.email
      fill_in "user[password]", with: user.password
      click_button "Log in"
    end

    scenario "user successfully deletes a group" do

      visit root_path
      click_link "Create a Group"
      fill_in "Title", with: "Car Talk"
      fill_in "Description", with: "lots of cars and junk"

      click_button "Create Group"
      click_link "Delete"
      expect(page).to have_content("You've successfully deleted a group!")
    end
  end
end
