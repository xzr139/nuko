FactoryGirl.define do
  factory :follow, class: 'Follow' do
    target_id { create(:user).id }
  end
end
