require 'spec_helper'

describe FollowersController, type: :controller do
  describe 'PATCH update' do
    context 'type valid value' do
      let!(:follow) { create(:follow) }

      before do
        patch :update, user_id: User.last.id
      end

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
  end

  context 'it should be increment number of activity count' do
    before do
      create_list(:user, 2)
      PublicActivity::Common.activity_count = 0
    end

    it 'should be success create_activity' do
      expect { patch :update, user_id: User.last.id }.to change {
        PublicActivity::Common.activity_count
      }.from(0).to(1)
    end
  end
end
