# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

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
