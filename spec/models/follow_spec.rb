# == Schema Information
#
# Table name: followers
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  target_id  :integer
#  created_at :datetime
#  updated_at :datetime
#  followed   :boolean
#
# Indexes
#
#  index_followers_on_user_id  (user_id)
#

require 'rails_helper'

describe Follow, type: :model do
  let(:follow) { create(:follow) }

  describe "#target_user" do
    it "returns user model" do
      expect(follow.target_user.class).to eq(User)
      expect(follow.target_user).to eq(User.last)
    end
  end
end
