require "spec_helper"

describe NotesController, type: :controller do
  describe "GET #index" do
    before do
      12.times { create(:note) }
      get :index
    end

    it "returns 10" do
      expect(assigns[:notes].count).to eq(10)
    end
  end

  describe "GET public" do
    before do
      12.times { create(:note) }
      get :public
    end

    it "returns  10" do
      expect(assigns[:notes].count).to eq(10)
    end
  end

  describe "GET show" do
    let(:note) { create(:note) }

    before do
      get :show, id: note.to_param
    end

    it "returns selected id" do
      expect(assigns[:note]).to eq(Note.last)
    end
  end

  describe "POST create" do
    context "when valid params" do
      let(:user) { create(:user) }

      it "creates a new note" do
        expect { post :create, note: attributes_for(:note) }.to change {
          Note.count
        }.from(0).to(1)
      end

      it "returns redirect to the created note" do
        post :create, note: attributes_for(:note)
        expect(response).to redirect_to(Note.last)
      end
    end

    context "when invalid params" do
      let(:user) { create(:user) }

      before { allow_any_instance_of(Note).to receive(:save).and_return(false) }

      it "returns a new note instance" do
        post :create, note: attributes_for(:note)
        expect(assigns(:note)).to be_a_new(Note)
      end

      it "returns redirect" do
        post :create, note: attributes_for(:note)
        expect(response).to render_template("index")
      end
    end
  end

  describe 'PUT updatee' do
    let!(:request) { put :update, params }

    context 'when valid value' do
      let(:note) { create(:note) }
      let(:params) { { id: note.id, note: attributes_for(:note) } }

      before { request }

      it 'returns redirect' do
        expect(response).to redirect_to(Note.last)
      end

      it 'returns same note as value' do
        expect(assigns(:note)).to eq(note)
      end

      it 'has no error' do
        expect(assigns(:note).errors).to be_empty
      end
    end

    context 'when invalid value' do
      let(:note) { create(:note) }
      let(:title) { 'タイトルタイトルタイトルタイトルタイトルタイトルタイトルタイトルタイトルタイトルタイトルタイトルタイトルタイトル' }
      let(:params) { { id: note.id, note: attributes_for(:note, title: title) } }

      before { request }

      it 'returns render_template' do
        expect(response.status).to eq(200)
        expect(response).to render_template('edit')
      end

      it 'returns same note as value' do
        expect(assigns(:note)).to eq(note)
      end

      it 'returns error' do
        expect(assigns(:note).errors).not_to be_empty
      end
    end
  end

  describe 'DELETE destroy' do
    let!(:note) { create(:note) }

    it "creates a new note" do
      expect { delete :destroy, id: note.id }.to change {
        Note.count
      }.from(1).to(0)
    end
  end
end
