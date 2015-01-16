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
        sign_in_as(user)
      end

    scenario "user successfully deletes a group" do

      group = FactoryGirl.create :group

      visit group_path(group)
      click_on "Join Group"
      click_on "Options"
      click_on "Delete Group"

      expect(page).to have_content("You've successfully deleted a group!")
    end
  end
end
