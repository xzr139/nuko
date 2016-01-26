require 'rails_helper'

describe Api::NotesController, type: :controller do
  describe '.preview' do
    let(:rendered_html) { %(<a href=\"#hoge\">) }
    before { get :preview, markdown: "# hoge" }

    it 'returns status with 200' do
      expect(response.status).to eq(200)
    end

    it 'returns parsed html from markdown' do
      expect(response.body).to include(rendered_html)
    end
  end
end
