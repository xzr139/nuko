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

FactoryGirl.define do
  factory :follow, class: 'Follow' do
    association :user
  end
end
