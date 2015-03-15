# == Schema Information
#
# Table name: follow_activities
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  target_id   :integer
#  follow_type :string(255)
#  followed    :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :follow_activities, class: 'FollowActivity' do
    association :user
    target_id { create(:user).id }
  end
end
