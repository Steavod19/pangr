require "rails_helper"

feature "User edits a  post", %q(
  As an authenticated user
  I want to edit a post within a group
  So that other people can read my updated post

  Acceptance Criteria
  [ ] Go to groups/group[:id]/posts/post[:id]/edit to fill out form
  [ ] User must enter body

  ) do

    let(:group){ FactoryGirl.create(:group) }


  context "authenticated user" do
    before(:each) do
      sign_in_as(group.user)
    end

    scenario "user successfully edits a post" do

      visit group_path(group)

      fill_in "Post:", with: "This is my comment on the subject"
      click_button "Post"

      click_link "Edit Post"
      fill_in "Post:", with: "Here is the new subject of my post"
      click_button "Post"


      expect(page).to have_content("You've successfully updated your post!")
      expect(page).to have_content("Here is the new subject of my post")

    end

    scenario "user unsuccessfully edits a post" do

      visit group_path(group)
      fill_in "Post:", with: ""
      click_button "Post"
      expect(page).to have_content("Body cannot be blank")
    end
  end
end
