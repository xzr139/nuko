FactoryGirl.define do
  factory :follow, class: 'Follow' do
    association :user
  end
end
