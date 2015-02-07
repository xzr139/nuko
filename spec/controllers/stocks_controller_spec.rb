require 'spec_helper'

describe StocksController, type: :controller do
  describe 'PATCH update' do
    context 'type valid value' do
      let!(:stock) { create(:stock) }

      before { patch :update, note_id: stock.note_id }

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

    context 'update test' do
      let(:note) { create(:note) }

      it 'should increment stocks' do
        expect { patch :update, note_id: note.id }.to change {
          Stock.count
        }.from(0).to(1)
      end
    end

    context 'update test' do
      let!(:stock) { create(:stock, stocked: true) }

      before do
        ApplicationController.any_instance.stub(:current_user).and_return(stock.user)
        patch :update, note_id: Note.last.id
      end

      it 'should update followed' do
        expect(assigns[:stock].stocked).to eq(false)
      end
    end
  end
end
