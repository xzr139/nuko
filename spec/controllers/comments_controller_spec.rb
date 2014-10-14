require "spec_helper"

describe CommentsController, type: :controller do
  describe "POST create" do
    let(:note) { create(:note) }
    let(:ids_hash) { { user_id: note.user.id,   note_id: note.id } }

    before do
      ApplicationController.any_instance.stub(:current_user).and_return(note.user)
    end

    it "should be success create" do
      expect { post :create, comment: attributes_for(:comment).merge(ids_hash) }.to change {
        Comment.count
      }.from(0).to(1)
    end
  end
end
