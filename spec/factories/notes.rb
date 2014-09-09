# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:title) { |n| "title#{n}" }
  sequence(:content) { |n| "content#{n}" }

  factory :note do
    title
    content
    association(:user)
  end
end
