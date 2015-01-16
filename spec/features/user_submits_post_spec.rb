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

  context "authenticated user" do

    let(:user){ FactoryGirl.create(:user) }
    before(:each) do
      sign_in_as(user)
    end

    scenario "successfully submits a post" do

      group = FactoryGirl.create :group

      visit group_path(group)

      click_on "Join Group"
      fill_in "Post:", with: "This is my comment on the subject"
      click_button "Post"

      expect(page).to have_content("You've successfully submitted a post!")
      expect(page).to have_content("This is my comment on the subject")

    end

    scenario "unsuccessfully submits a post" do
      group = FactoryGirl.create :group

      visit group_path(group)

      click_on "Join Group"
      fill_in "post_body", with: ""
      click_on "Post"
      save_and_open_page
      expect(page).to have_content("Body can't be blank")
    end
  end
end
