FactoryGirl.define do
  factory :tag, class: 'Tag' do
    sequence(:name) { |n| "content#{n}" }
  end
end
