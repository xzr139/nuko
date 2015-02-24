# == Schema Information
#
# Table name: notes
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  content        :text(65535)
#  user_id        :integer
#  created_at     :datetime
#  updated_at     :datetime
#  deleted_at     :datetime
#  comments_count :integer          default("0"), not null
#
# Indexes
#
#  index_notes_on_user_id  (user_id)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :note do
    sequence(:title) { |n| "title#{n}" }
    sequence(:content) { |n| "content#{n}" }
    association(:user)
  end
end
