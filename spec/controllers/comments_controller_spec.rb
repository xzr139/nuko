require "spec_helper"

describe CommentsController, type: :controller do
  describe "POST create" do
    let(:user) { create(:user) }
    let(:note) { create(:note) }
    before do
      ApplicationController.any_instance.stub(:current_user).and_return(user)
    end

    it "should be success create" do
      expect { post :create,  note_id: note.id, comment: attributes_for(:comment) }.to change {
        Comment.count
      }.from(0).to(1)
    end
  end
end
