require 'rails_helper'

describe FollowersController, type: :controller do
  describe 'PATCH #update' do
    let(:user) { create(:user) }

    context 'when invalid value' do
      let!(:follow_activities) { create(:follow_activities) }

      before { patch :update, user_id: user.id }

      it 'has no error' do
        expect(assigns(:follow).errors).to be_empty
      end

      it 'same follow as a FollowActivity last value' do
        expect(assigns(:follow)).to eq(FollowActivity.last)
      end
    end

    describe "#create_activity" do
      it 'has been incremented FollowActivity' do
        expect { patch :update, user_id: user.id }.to change {
          FollowActivity.count
        }.from(0).to(1)
      end
    end

    context 'when exists the follower' do
      let(:user) { create(:user) }
      before { patch :update, user_id: user.id }

      it 'has no error' do
        expect(assigns(:follow).errors).to be_empty
      end
    end

    describe 'PATCH #update' do
      let!(:follow_activities) { create(:follow_activities, followed: true) }
      let!(:followers) { create(:follow, user: follow_activities.user, target_id: User.last.id) }

      before do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(follow_activities.user)
        patch :update, user_id: User.last.id
      end

      it 'updates @follow' do
        expect(assigns[:follow].followed).to eq(false)
      end
    end
  end

  describe "#create_activity" do
    before { create_list(:user, 2) }

    it 'increments number of activity count' do
      expect { patch :update, user_id: User.last.id }.to change {
        Activity.count
      }.from(0).to(1)
    end
  end
end
