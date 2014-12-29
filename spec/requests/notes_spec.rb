require "spec_helper"

describe "Notes", type: :request do
  def create_note
    visit root_path
    fill_in "note_title",        with: "title"
    fill_in "note_content",      with: "# hoge"
    fill_in "note_tag_list",     with: "tag1 tag2"
    click_button "submit-note"
  end

  describe "POST create" do
    before do
      visit "/auth/facebook"
      ApplicationController.any_instance.stub(:current_user).and_return(User.last)
      create_note
    end

    it "should be success create and destroy", js: true do
      expect(page).to have_content("hoge")
    end
  end

  describe "GET show" do
    before do
      visit "/auth/facebook"
      ApplicationController.any_instance.stub(:current_user).and_return(User.last)
      create_note
    end

    it "should see h1 tag", js: true do
      expect(page.body).to include("<h1>hoge</h1>")
    end
  end
end
