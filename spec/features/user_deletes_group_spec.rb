  require "rails_helper"

  feature "User deletes a group", %q(
    As an authenticated user
    I want to delete a group
    So that I can delete the group

    Acceptance Criteria
    [ ] Go to groups/group[:id]
    [ ] User must delete group

    ) do
      let(:group){ FactoryGirl.create(:group) }

    context "authenticated user" do

        before(:each) do
          sign_in_as(group.user)
        end

    scenario "user successfully deletes a group" do

      visit group_path(group)

      click_link "Delete"
      expect(page).to have_content("You've successfully deleted a group!")
    end
  end
end
