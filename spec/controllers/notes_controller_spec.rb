require "spec_helper"

describe NotesController, type: :controller do
  context "index" do
    before do
      12.times { create(:note) }
      get :index
    end

    it "should be return is 10" do
      expect(assigns[:notes].count).to eq(10)
    end
  end

  context "GET show" do
    before do
      note = create(:note)
      get :show, { id: note.to_param }
    end

    it "should be return is selected id" do
      expect(assigns[:note]).to eq(Note.last)
    end
  end

  describe "POST create" do
    context "with valid params" do
      before do
        @user = create(:user)
        @params = { note: attributes_for(:note) }
        ApplicationController.any_instance.stub(:current_user).and_return(@user)
      end

      it "creates a new note" do
        expect {
          post :create, { note: @params }
        }.to change(Note, :count).by(1)
      end

      it "redirects to the created note" do
        post :create, { note: @params }
        expect(response).to redirect_to(Note.last)
      end
    end

    context "with invalid params" do
      before do
        @user = create(:user)
        @params = { note: attributes_for(:note) }
        ApplicationController.any_instance.stub(:current_user).and_return(@user)
      end

      it "assigns a newly created but unsaved note as @note" do
        Note.any_instance.stub(:save).and_return(false)
        post :create, { note: @params }
        expect(assigns(:note)).to be_a_new(Note)
      end

      it "re-renders the 'new' template" do
        Note.any_instance.stub(:save).and_return(false)
        post :create, { note: @params }
        expect(response).to render_template("index")
      end
    end
  end

  describe 'PUT updatee' do
    let(:request) { put :update, params}

    context 'type valid value' do
      let(:note) { create(:note)}
      let(:params) { { id: note.id, note: attributes_for(:note) } }

      it 'should be sccess' do
        request
        expect(response).to redirect_to(Note.last)
      end

      it 'is in agreement with what note to edit chose' do
        request
        expect(assigns(:note)).to eq(note)
      end

      it 'should be no error' do
        request
        expect(assigns(:note).errors).to be_empty
      end
    end

    context 'type unvalid value' do
      let(:note) { create(:note)}
      let(:title) { 'タイトルタイトルタイトルタイトルタイトルタイトルタイトルタイトルタイトルタイトルタイトルタイトルタイトルタイトル' }
      let(:params) { { id: note.id, note: attributes_for(:note, title: title) } }

      it 'should be success and render edit' do
        request
        expect(response.status).to eq(200)
        expect(response).to render_template('edit')
      end

      it 'is in agreement with what note to edit chose' do
        request
        expect(assigns(:note)).to eq(note)
      end

      it 'should be validation erorr' do
        request
        expect(assigns(:note).errors).not_to be_empty
      end
    end
  end
end
