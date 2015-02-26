# == Schema Information
#
# Table name: follow_activities
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  target_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#  followed    :boolean
#  follow_type :string(255)
#
# Indexes
#
#  index_follow_activities_on_user_id  (user_id)
#

FactoryGirl.define do
  factory :follow_activities, class: 'FollowActivity' do
    association :user
    target_id { create(:user).id }
  end
end
