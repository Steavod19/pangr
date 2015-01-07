require "rails_helper"

feature "User Submits a new post", %q(
  As an authenticated user
  I want to submit a post within a group
  So that other people can read my post

  Acceptance Criteria
  [ ] Go to groups/group[:id]/post/new to fill out form
  [ ] User must enter title
  [ ] User must enter description

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

    scenario "user successfully submits a post" do

      visit group_path(group)

      fill_in "body", with: "This is my comment on the subject"
      click_button "Post"
      expect(page).to have_content("You've successfully submitted a post!")
      expect(page).to have_content("This is my comment on the subject")

    end

    scenario "user unsuccessfully submits a post" do

      visit group_path(group)
      fill_in "body", with: ""

      click_button "Post"
      expect(page).to have_content("You've failed to created a post!")
    end
  end
end
