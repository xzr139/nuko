require "spec_helper"

describe UsersController,  type: :controller do
  context "GET edit" do
    let(:user) { create(:user) }

    before do
      get :edit, id: user.id
    end

    it "should be success" do
      expect(response.status).to eq(200)
    end
  end
end
