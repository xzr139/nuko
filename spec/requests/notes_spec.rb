require "spec_helper"

describe "Notes", type: :request do
  describe "POST create" do
    before do
      visit "/auth/facebook"
      ApplicationController.any_instance.stub(:current_user).and_return(User.last)
    end

    it "should be success create and destroy", js: true do
      visit root_path
      fill_in "note_title",        with: "title"
      fill_in "note_content",      with: "content"
      fill_in "note_tag_list",     with: "tag1 tag2"
      click_button "submit-note"
      expect(page).to have_content("content")
    end
  end
end
