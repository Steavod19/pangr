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
    let(:user){ FactoryGirl.create(:user) }

    before(:each) do
      visit new_user_session_path
      fill_in "user[email]", with: user.email
      fill_in "user[password]", with: user.password
      click_button "Log in"
    end

    scenario "user successfully deletes a post" do

      visit group_path(group)

      fill_in "Post:", with: "This is my comment on the subject"
      click_button "Post"

      click_button "Delete Post"
      expect(page).to have_content("You've successfully deleted a buddy!")


    end
  end
end
