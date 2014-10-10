require "spec_helper"

describe "Notes", type: :request do
  describe "GET index" do
    let(:note) { create(:note) }

    it "should be success page load" do
      get note_path(note)
      expect(response.status).to be(200)
    end
  end
end
