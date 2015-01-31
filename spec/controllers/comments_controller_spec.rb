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
  end

  context "DELETE destory" do
    let!(:comment) { create(:comment) }

    it "should be success delete" do
      expect { delete :destroy, id: comment.id }.to change{
        Comment.count
      }.from(1).to(0)
    end
  end

  context "PUT update" do
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
      ApplicationController.any_instance.stub(:current_user).and_return(like.user)
      patch :unlike, id: like.comment.id
    end

    it "should be success unlike" do
      expect(Like.last.liked).to eq(false)
    end
  end

  context 'should be increment number of activity count' do
    let(:user) { create(:user) }
    let(:comment) { create(:comment) }

    before do
      PublicActivity::Common.activity_count = 0
    end

    it 'should be success create_activity' do
      expect { post :create, comment: comment.attributes }.to change {
        PublicActivity::Common.activity_count
      }.from(0).to(1)
    end
  end
end
