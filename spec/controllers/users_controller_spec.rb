require "spec_helper"

describe UsersController,  type: :controller do
  context "GET show" do
    before do
      user = create(:user)
      get :show, { id: user.id }
    end

    it "should be return is selected id" do
      expect(assigns[:user]).to eq(User.last)
    end
  end
end
