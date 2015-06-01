require 'spec_helper'

describe FollowersController, type: :controller do
  describe 'PATCH #update' do
    let(:user) { create(:user) }

    context 'when type valid value' do
      let!(:follow_activities) { create(:follow_activities) }

      before { patch :update, user_id: user.id }

      it 'has no erorr' do
        expect(response.body).to be_blank
      end

      it 'same follow as a FollowActivity last value' do
        expect(assigns(:follow)).to eq(FollowActivity.last)
      end

      it 'has no error' do
        expect(assigns(:follow).errors).to be_empty
      end
    end

    describe "#create_activity" do
      it 'has been incremented FollowActivity' do
        expect { patch :update, user_id: user.id }.to change {
          FollowActivity.count
        }.from(0).to(1)
      end
    end

    context 'when exist the follower' do
      let(:user) { create(:user) }

      before do
        allow_any_instance_of(FollowActivity).to receive(:exists?).and_return(true)
        patch :update, user_id: user.id
      end

      it 'has no erorr' do
        expect(response.body).to be_blank
      end

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

      it 'has been updated @follow' do
        expect(assigns[:follow].followed).to eq(false)
      end
    end
  end

  describe "#create_activity" do
    before { create_list(:user, 2) }

    it 'should be increment number of activity count' do
      expect { patch :update, user_id: User.last.id }.to change {
        Activity.count
      }.from(0).to(1)
    end
  end
end
