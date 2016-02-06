require 'rails_helper'

describe TagsController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PATCH #follow' do
    let(:tag) { create(:tag) }

    context 'when valid value' do
      let!(:follow_activities) { create(:follow_activities) }
      before { patch :follow, id: tag.id, target_id: tag.id }

      it 'same @follow as a FollowActivity last value' do
        expect(assigns(:follow)).to eq(FollowActivity.last)
      end

      it 'has no error' do
        expect(assigns(:follow).errors).to be_empty
      end
    end

    context 'with new follower' do
      it 'will be created FollowActivity' do
        expect { patch :follow, id: tag.id, target_id: tag.id }.to change {
          FollowActivity.count
        }.from(0).to(1)
      end
    end

    context 'when existed in' do
      before { patch :follow, id: tag.id, target_id: tag.id }

      it 'has no error' do
        expect(assigns(:follow).errors).to be_empty
      end
    end

    context 'when not existed in' do
      let(:tag) { create(:tag) }
      let(:follow_activities) { create(:follow_activities, target_id: tag.id, followed: true) }

      before do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(follow_activities.user)
        patch :follow, id: tag.id, target_id: tag.id
      end

      it 'follows a user' do
        expect(assigns[:follow].followed).to eq(false)
      end
    end
  end
end
