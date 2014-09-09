require 'spec_helper'

describe StocksController, type: :controller do
  describe "POST create" do
    context "with valid params" do
      let(:user) { create(:user) }
      let(:note_id) { create(:note).id }

      before do
        ApplicationController.any_instance.stub(:current_user).and_return(user)
      end

      it "creates a new note" do
        expect {
          post :create, { note_id: note_id }
        }.to change(Stock, :count).by(1)
      end

      it "redirects to the created note" do
        post :create, { note_id: note_id }
        expect(response).to redirect_to(Note.last)
      end
    end
  end
end
