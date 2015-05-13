require 'spec_helper'

describe Follow, type: :model do
  let(:follow) { create(:follow) }

  describe "#target_user" do
    it "returns user model" do
      expect(follow.target_user.class).to eq(User)
      expect(follow.target_user).to eq(User.last)
    end
  end
end
