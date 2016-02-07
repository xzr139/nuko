require "spec_helper"

describe UsersController, type: :controller do
  context "GET edit" do
    let(:user) { create(:user) }
    before { get :edit, id: user.id }

    it "returns status with 200" do
      expect(response).to have_http_status 200
    end
  end
end
