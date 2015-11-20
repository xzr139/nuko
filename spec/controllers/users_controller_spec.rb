require "spec_helper"

describe UsersController,  type: :controller do
  describe "GET #edit" do
    let(:user) { create(:user) }
    before { get :edit, id: user.id }

    it "returns success status code" do
      expect(response.status).to eq(200)
    end
  end
end
