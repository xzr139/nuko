require 'rails_helper'

describe CommentsController, type: :controller do
  describe "POST #create" do
    let(:note) { create(:note) }
    let(:ids_hash) { { user_id: note.user.id, note_id: note.id } }

    context "when creation is succeeded" do
      it "has been incremented Comment" do
        expect { post :create, comment: attributes_for(:comment).merge(ids_hash) }.to change {
          Comment.count
        }.from(0).to(1)
      end
    end

    context "when creation is failed" do
      before do
        post :create, comment: attributes_for(:note)
          .update(content: 'content' * 300)
          .merge(ids_hash)
      end

      it "assigns a newly created but unsaved note as @note" do
        expect(assigns(:comment)).to be_a_new(Comment)
      end

      it "returns redirect to url" do
        expect(response).to redirect_to(Note.last)
      end
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
    let(:note) { create(:note) }
    let(:comment) { create(:comment) }
    let(:ids_hash) { { user_id: note.user.id, note_id: note.id } }

    context 'when type valid value' do
      before { put :update, id: comment.id, comment: attributes_for(:comment).merge(ids_hash) }

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
      before { put :update, id: comment.id, comment: attributes_for(:comment).merge(ids_hash) }

      it 'returns redirect to url' do
        expect(response).to redirect_to(Note.last)
      end

      it 'returns same comment as a value' do
        expect(assigns(:comment)).to eq(comment)
      end

      it 'has erorr' do
        expect(assigns(:comment).errors).to be_empty
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
