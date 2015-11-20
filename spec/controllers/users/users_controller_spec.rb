require "spec_helper"

describe UsersController, type: :controller do
  context "GET edit" do
    let(:user) { create(:user) }
    before { get :edit, id: user.id }

    it "should be success" do
      expect(response.status).to eq(200)
    end
  end
end
