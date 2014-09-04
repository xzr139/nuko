require "spec_helper"

describe NotesController, type: :request do
  context "index" do
    before do
      12.times { create(:note) }
      get '/notes'
    end

    it "should be return is 10" do
      expect(assigns[:notes].count).to eq(10)
    end
  end
end
