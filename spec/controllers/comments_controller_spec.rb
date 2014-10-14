require "spec_helper"

describe CommentsController, type: :controller do
  describe "POST create" do
    let(:note) { create(:note) }
    before do
      ApplicationController.any_instance.stub(:current_user).and_return(note.user)
    end

    it "should be success create" do
      expect { post :create, comment: attributes_for(:comment).merge({ user_id: note.user.id,  note_id: note.id }) }.to change {
        Comment.count
      }.from(0).to(1)
    end
  end
end
