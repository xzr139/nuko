require 'spec_helper'

describe FollowersController, type: :controller do
  describe 'PATCH update' do
    let(:user) { create(:user) }

    context 'type valid value' do
      let!(:follow) { create(:follow) }

      before { patch :update, user_id: user.id }

      it 'should be blank' do
        expect(response.body).to be_blank
      end

      it 'is in agreement with what note to edit chose' do
        expect(assigns(:follow)).to eq(Follow.last)
      end

      it 'should be no error' do
        expect(assigns(:follow).errors).to be_empty
      end
    end

    context 'update test' do
      it 'should update followed' do
        expect { patch :update, user_id: user.id }.to change {
          Follow.count
        }.from(0).to(1)
      end
    end

    context 'is exist follow' do
      let(:user) { create(:user) }

      before do
        allow_any_instance_of(Follow).to receive(:exists?).and_return(true)
        patch :update, user_id: user.id
      end

      it 'should be not blank' do
        expect(response.body).to be_blank
      end

      it 'should be no error' do
        expect(assigns(:follow).errors).to be_empty
      end
    end

    context 'update test' do
      let!(:follow) { create(:follow, followed: true) }

      before do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(follow.user)
        patch :update,  user_id: User.last.id
      end

      it 'should update followed' do
        expect(assigns[:follow].followed).to eq(false)
      end
    end
  end

  context 'it should be increment number of activity count' do
    before { create_list(:user, 2) }

    it 'should be success create_activity' do
      expect { patch :update, user_id: User.last.id }.to change {
        Activity.count
      }.from(0).to(1)
    end
  end
end
