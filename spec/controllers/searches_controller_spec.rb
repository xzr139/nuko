require 'spec_helper'

describe SearchesController, type: :controller do
  describe "GET index" do
    before do
      create_list(:note, 12)
      create(:note, content: 'hogeeee')
      get :index, content: 'hoge'
    end

    it 'should return 200' do
      expect(response).to be_success
    end

    it 'should return selected query only note' do
      expect(assigns[:notes].count).to eq(1)
      expect(assigns[:notes].first.content).to eq('hogeeee')
    end
  end
end
