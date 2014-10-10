require "spec_helper"

describe "Notes", type: :request do
  describe "GET index" do
    let(:note) { create(:note) }

    it "should be success page load" do
      get note_path(note)
      expect(response.status).to be(200)
    end
  end

  describe "POST create" do
    let(:note) { create(:note) }

    before do
      visit "/auth/facebook"
      ApplicationController.any_instance.stub(:current_user).and_return(User.last)
    end

    it "should be none notes", js: true do
      visit root_path
      expect(page).not_to have_css("div.block")
    end

    it "should be success create", js: true do
      visit root_path
      fill_in "note_title",        with: "title"
      fill_in "note_content",      with: "content"
      fill_in "note_tag_list",     with: "tag1 tag2"
      click_button "submit-note"
      expect(page).to have_content("content")
    end
  end
end
