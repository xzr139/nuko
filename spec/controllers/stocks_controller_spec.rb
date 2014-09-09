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

    context "with invalid params" do
      let(:user) { create(:user) }
      let(:note_id) { create(:note).id }
      let!(:stock) { create(:stock) }

      before do
        ApplicationController.any_instance.stub(:current_user).and_return(user)
        Stock.any_instance.stub(:save).and_return(false)
        post :create, { note_id: stock.note_id }
      end

      it "assigns a newly created but unsaved note as @stock" do
        expect(assigns(:stock)).to be_a_new(Stock)
      end

      it "re-renders the 'new' template" do
        expect(response).to be_redirect
        expect(response).to redirect_to(note_path(stock.note))
      end
    end
  end
end
