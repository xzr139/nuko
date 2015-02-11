require "spec_helper"

describe CommentsController, type: :controller do
  context "POST create" do
    let(:note) { create(:note) }
    let(:ids_hash) { { user_id: note.user.id,   note_id: note.id } }

    it "should be success create" do
      expect { post :create, comment: attributes_for(:comment).merge(ids_hash) }.to change {
        Comment.count
      }.from(0).to(1)
    end

    it "assigns a newly created but unsaved note as @note" do
      allow_any_instance_of(Comment).to receive(:save).and_return(false)
      post :create, comment: attributes_for(:note).merge(ids_hash)
      expect(assigns(:comment)).to be_a_new(Comment)
    end

    it "re-render the 'new' template" do
      allow_any_instance_of(Comment).to receive(:save).and_return(false)
      post :create, comment: attributes_for(:note).merge(ids_hash)
      expect(response).to redirect_to(Note.last)
    end
  end

  context "DELETE destory" do
    let!(:comment) { create(:comment) }

    it "should be success delete" do
      expect { delete :destroy, id: comment.id }.to change{
        Comment.count
      }.from(1).to(0)
    end
  end

  describe "PUT update" do
    let!(:request) { put :update, params }

    context 'type valid value' do
      let(:comment) { create(:comment) }
      let(:params) { { id: comment.id, comment: attributes_for(:comment) } }

      before { request }

      it 'should be sccess' do
        expect(response).to redirect_to(Note.last)
      end

      it 'is in agreement with what note to edit chose' do
        expect(assigns(:comment)).to eq(comment)
      end

      it 'should be no error' do
        expect(assigns(:comment).errors).to be_empty
      end
    end

    context 'type invalid value' do
      let(:comment) { create(:comment) }
      let(:params) { { id: comment.id, comment: attributes_for(:comment) } }

      before do
        allow_any_instance_of(Comment).to receive(:update).and_return(false)
        request
      end

      it 'should be success and render edit' do
        expect(response).to redirect_to(Note.last)
      end

      it 'is in agreement with what note to edit chose' do
        expect(assigns(:comment)).to eq(comment)
      end
    end
  end

  context "PATCH like" do
    let(:comment) { create(:comment) }

    it "should be success create like" do
      expect { patch :like, id: comment.id }.to change{
        Like.count
      }.from(0).to(1)
    end
  end

  context "PATCH unlike" do
    let!(:like) { create(:like) }

    before do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(like.user)
      patch :unlike, id: like.comment.id
    end

    it "should be success unlike" do
      expect(Like.last.liked).to eq(false)
    end
  end

  context 'should be increment number of activity count' do
    let(:user) { create(:user) }
    let(:comment) { create(:comment) }

    it 'should be success create_activity' do
      expect { post :create, comment: comment.attributes }.to change {
        Activity.count
      }.from(0).to(1)
    end
  end
end
