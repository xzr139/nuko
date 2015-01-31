require "spec_helper"

describe CommentsController, type: :controller do
  describe "POST create" do
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
