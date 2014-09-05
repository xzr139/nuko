require "spec_helper"

describe NotesController, type: :controller do
  context "index" do
    before do
      12.times { create(:note) }
      get :index
    end

    it "should be return is 10" do
      expect(assigns[:notes].count).to eq(10)
    end
  end

  context "show" do
    before do
      12.times { create(:note) }
      get :show, { id: Note.first.id.to_s }
    end

    it "should be return is selected id" do
      expect(assigns[:note]).to eq(Note.first)
    end
  end
end
