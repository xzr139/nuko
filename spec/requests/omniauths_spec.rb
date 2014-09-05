require "spec_helper"

describe "Omniauths", type: :request do
  describe "GET /auth/facebok" do
    let(:user) { User.last }
    let(:oauth_user) { OmniAuth.config.mock_auth[:facebook] }

    before { visit "/auth/facebook" }

    it 'should be the same' do
      expect(user).not_to eq nil
      expect(user.facebook_id).to eq oauth_user.uid
      expect(user.full_name).to eq oauth_user.extra.raw_info.name
      expect(user.email).to eq oauth_user.info.email
    end
  end
end
