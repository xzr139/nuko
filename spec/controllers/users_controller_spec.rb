require "spec_helper"

describe UsersController,  type: :controller do
  describe "GET #edit" do
    let(:user) { create(:user) }

    before do
      get :edit, id: user.id
    end

    it "returns success status code" do
      expect(response.status).to eq(200)
    end
  end
end
