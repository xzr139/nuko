# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  facebook_id         :string(255)      not null
#  email               :string(255)
#  full_name           :string(255)
#  nick_name           :string(255)
#  token               :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  company             :string(255)
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  bio                 :text
#  language            :string(255)
#

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
