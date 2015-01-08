require 'spec_helper'

describe StocksController, type: :controller do
  describe 'PATCH update' do
    context 'type valid value' do
      let!(:stock) { create(:stock) }

      before { patch :update, note_id: stock.note_id }

      after { PublicActivity::Common.activity_count = 0 }

      it 'should be blank' do
        expect(response.body).to be_blank
      end

      it 'is in agreement with what note to edit chose' do
        expect(assigns(:stock)).to eq(Stock.last)
      end

      it 'should be no error' do
        expect(assigns(:stock).errors).to be_empty
      end
    end
  end

  context 'it should be increment number of activity count' do
    let(:user) { create(:user) }
    let(:note) { create(:note) }

    before do
      PublicActivity::Common.activity_count = 0
    end

    it 'should be success create_activity' do
      expect { patch :update, note_id: note.id }.to change {
        PublicActivity::Common.activity_count
      }.from(0).to(1)
    end
  end
end
