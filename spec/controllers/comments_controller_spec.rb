require 'rails_helper'

describe CommentsController, type: :controller do
  describe "POST #create" do
    let(:note) { create(:note) }
    let(:ids_hash) { { user_id: note.user.id,   note_id: note.id } }

    it "has been incremented Comment" do
      expect { post :create, comment: attributes_for(:comment).merge(ids_hash) }.to change {
        Comment.count
      }.from(0).to(1)
    end

    it "assigns a newly created but unsaved note as @note" do
      allow_any_instance_of(Comment).to receive(:save).and_return(false)
      post :create, comment: attributes_for(:note).merge(ids_hash)
      expect(assigns(:comment)).to be_a_new(Comment)
    end

    it "returns redirect to url" do
      allow_any_instance_of(Comment).to receive(:save).and_return(false)
      post :create, comment: attributes_for(:note).merge(ids_hash)
      expect(response).to redirect_to(Note.last)
    end
  end

  context "when delete comment" do
    let!(:comment) { create(:comment) }

    it "has been created" do
      expect { delete :destroy, id: comment.id }.to change{
        Comment.count
      }.from(1).to(0)
    end
  end

  describe "PUT #update" do
    let!(:request) { put :update, params }

    context 'when type valid value' do
      let(:comment) { create(:comment) }
      let(:params) { { id: comment.id, comment: attributes_for(:comment) } }

      before { request }

      it 'returns redirect to' do
        expect(response).to redirect_to(Note.last)
      end

      it 'is in agreement with what note to edit chose' do
        expect(assigns(:comment)).to eq(comment)
      end

      it 'has no erorr' do
        expect(assigns(:comment).errors).to be_empty
      end
    end

    context 'when type invalid value' do
      let(:comment) { create(:comment) }
      let(:params) { { id: comment.id, comment: attributes_for(:comment) } }

      before do
        allow_any_instance_of(Comment).to receive(:update).and_return(false)
        request
      end

      it 'returns redirect to url' do
        expect(response).to redirect_to(Note.last)
      end

      it 'returns same comment as a value' do
        expect(assigns(:comment)).to eq(comment)
      end
    end
  end

  describe "#create_activity" do
    let(:user) { create(:user) }
    let(:comment) { create(:comment) }

    it 'has been incremented Activity' do
      expect { post :create, comment: comment.attributes }.to change {
        Activity.count
      }.from(0).to(1)
    end
  end
end
