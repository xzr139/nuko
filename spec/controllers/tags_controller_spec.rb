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

    context 'when type valid value' do
      let!(:follow_activities) { create(:follow_activities) }

      before { patch :follow, id: tag.id, target_id: tag.id }

      it 'has no error' do
        expect(response.body).to be_blank
      end

      it 'same @follow as a FollowActivity last value' do
        expect(assigns(:follow)).to eq(FollowActivity.last)
      end

      it 'has no erorr' do
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

    context 'when exist follow' do
      before do
        allow_any_instance_of(FollowActivity).to receive(:exists?).and_return(true)
        patch :follow, id: tag.id, target_id: tag.id
      end

      it 'has no error' do
        expect(response.body).to be_blank
      end

      it 'has no error' do
        expect(assigns(:follow).errors).to be_empty
      end
    end

    context 'when follow at test' do
      let(:tag) { create(:tag) }
      let(:follow_activities) { create(:follow_activities, target_id: tag.id, followed: true) }

      before do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(follow_activities.user)
        patch :follow, id: tag.id, target_id: tag.id
      end

      it 'has been followed' do
        expect(assigns[:follow].followed).to eq(false)
      end
    end
  end
end
