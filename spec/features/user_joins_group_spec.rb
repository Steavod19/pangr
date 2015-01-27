require "rails_helper"

feature "User joins a group", %q(
  As an authenticated user
  I want to join a group
  So that I can post to that group

  Acceptance Criteria
  [ ] Go to group_path to join group

  ) do
    let(:group){ FactoryGirl.create(:group) }

    context "authenticated user" do
      before(:each) do
        sign_in_as(group.owner)
      end

    scenario "user successfully joins a group" do

      visit group_path(group)

      click_button "Join Group"
      expect(page).to have_content("You've successfully joined this group!")
    end

    scenario "user successfully leaves a group" do

      visit group_path(group)

      click_button "Join Group"
      click_on "Options"
      click_on "Leave Group"

      expect(page).to have_content("You've successfully left the group!")

    end
  end
end
