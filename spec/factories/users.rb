# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:facebook_id) { |n| n * 1000 }
  sequence(:email) { |n| "sachin#{n}@gmail.com" }
  sequence(:full_name) { |n| "hoge fuga foo#{n}" }
  sequence(:nick_name) { |n| "sachin#{n}" }
  sequence(:token) { |n| "token#{n}" }
  sequence(:company) { |n| "company#{n}" }
  sequence(:bio) { |n| "jikoshoukai#{n}" }

  factory :user do
    facebook_id
    email
    full_name
    nick_name
    token
    company
    bio
    language :en
  end
end
