require "spec_helper"

describe NotesController, type: :request do
  let(:notes_path) { "/notes" }

  context "index" do
    before do
      12.times { create(:note) }
      get notes_path
    end

    it "should be return is 10" do
      expect(assigns[:notes].count).to eq(10)
    end
  end

  context "show" do
    before do
      12.times { create(:note) }
      get notes_path + "/" + Note.first.id.to_s
    end

    it "should be return is selected id" do
      expect(assigns[:note]).to eq(Note.first)
    end
  end
end
