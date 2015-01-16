require "rails_helper"

feature "User deletes a post", %q(
  As an authenticated user
  I want to delete a post that I created within a group
  So that my information is deleted

  Acceptance Criteria
  [ ] Go to groups/group[:id]
  [ ] User must be able to delete post

  ) do

  context "authenticated user" do

    let(:user){ FactoryGirl.create(:user) }
    before(:each) do
      sign_in_as(user)
    end
    let(:group){ FactoryGirl.create(:group) }


    scenario "user successfully deletes a post" do

      visit group_path(group)
      click_on  "Join Group"
      fill_in "Post:", with: "This is my comment on the subject"
      click_button "Post"

      click_link  "Delete Post"
      expect(page).to have_content("You've successfully deleted a post!")
    end
  end
end
