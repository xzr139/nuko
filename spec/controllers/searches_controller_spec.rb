require 'spec_helper'

describe SearchesController, type: :controller do
  context "GET index" do
    before do
      12.times { create(:note) }
      create(:note, content: 'hogeeee')
      get :index, content: 'hoge'
    end

    it 'should be return 200' do
      expect(response).to be_success
    end

    it 'should be return selected query only note' do
      expect(assigns[:notes].count).to eq(1)
      expect(assigns[:notes].first.content).to eq('hogeeee')
    end
  end
end
