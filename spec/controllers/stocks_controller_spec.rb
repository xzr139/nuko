require 'spec_helper'

describe StocksController, type: :controller do
  describe 'PATCH update' do
    context 'type valid value' do

      before do
        @stock = create(:stock, stocked: true)
        @user = @stock.user
        ApplicationController.any_instance.stub(:current_user).and_return(@user)
        patch :update, { note_id: @stock.note_id }
      end

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
end
