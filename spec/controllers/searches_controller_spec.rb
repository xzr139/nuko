require 'rails_helper'

describe SearchesController, type: :controller do
  describe "GET #index" do
    before do
      create_list(:note, 12)
      create(:note, content: 'hogeeee')
      get :index, content: 'hoge'
    end

    it 'returns status with 200' do
      expect(response).to have_http_status 200
    end

    it 'returns selected query only note' do
      expect(assigns[:notes].count).to eq(1)
      expect(assigns[:notes].first.content).to eq('hogeeee')
    end
  end
end
