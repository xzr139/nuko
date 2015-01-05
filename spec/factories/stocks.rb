# == Schema Information
#
# Table name: stocks
#
#  id         :integer          not null, primary key
#  note_id    :integer          not null
#  user_id    :integer          not null
#  stocked    :boolean          default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :stock do
    association :note
    association :user
    stocked false
  end
end
