require "spec_helper"

describe "Notes", type: :request do
  def create_note
    visit root_path
    fill_in "note_title",        with: "title"
    fill_in "note_content",      with: "# hoge"
    fill_in "note_tag_list",     with: "tag1 tag2"
    click_button "submit"
  end

  describe "POST create" do
    before do
      create_note
    end

    scenario "should be success create and destroy" do
      expect(page).to have_content("hoge")
    end
  end
end
