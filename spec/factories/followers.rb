# == Schema Information
#
# Table name: followers
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  target_user_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#  followed       :boolean
#
# Indexes
#
#  index_followers_on_user_id  (user_id)
#

FactoryGirl.define do
  factory :follow, class: 'Follow' do
    association :user
    target_user_id { create(:user).id }
  end
end
