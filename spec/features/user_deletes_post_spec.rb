require "rails_helper"

feature "User deletes a post", %q(
  As an authenticated user
  I want to delete a post that I created within a group
  So that my information is deleted

  Acceptance Criteria
  [ ] Go to groups/group[:id]
  [ ] User must be able to delete post

  ) do
    let(:group){ FactoryGirl.create(:group) }

  context "authenticated user" do

    before(:each) do
      sign_in_as(group.user)
    end

    scenario "user successfully deletes a post" do

      visit group_path(group)

      fill_in "Post:", with: "This is my comment on the subject"
      click_button "Post"

      click_link  "Delete Post"
      expect(page).to have_content("You've successfully deleted a post!")
    end
  end
end
