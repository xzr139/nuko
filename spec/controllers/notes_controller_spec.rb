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

  context "show" do
    before do
      12.times { create(:note) }
      get :show, { id: Note.first.id.to_s }
    end

    it "should be return is selected id" do
      expect(assigns[:note]).to eq(Note.first)
    end
  end

  describe "with valid params" do
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

  describe "with invalid params" do
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
