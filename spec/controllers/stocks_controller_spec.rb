require 'rails_helper'

describe StocksController, type: :controller do
  describe 'PATCH #update' do
    context 'when valid value' do
      let!(:stock) { create(:stock) }

      before { patch :update, note_id: stock.note_id }

      it 'returns not empty value' do
        expect(response.body).to be_blank
      end

      it 'return same Stock.last as stock instance' do
        expect(assigns(:stock)).to eq(Stock.last)
      end

      it 'has no error' do
        expect(assigns(:stock).errors).to be_empty
      end
    end

    context 'when created in' do
      let(:note) { create(:note) }

      it 'returns incremented stocks table' do
        expect { patch :update, note_id: note.id }.to change {
          Stock.count
        }.from(0).to(1)
      end
    end

    context 'when updated in' do
      let!(:stock) { create(:stock, stocked: true) }

      before do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(stock.user)
        patch :update, note_id: Note.last.id
      end

      it 'returns false' do
        expect(assigns[:stock].stocked).to eq(false)
      end
    end
  end
end
