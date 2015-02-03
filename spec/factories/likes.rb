# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  note_id    :integer          not null
#  comment_id :integer          not null
#  user_id    :integer          not null
#  liked      :boolean          default("0")
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :like do
    association(:comment)
    association(:user)
    association(:note)
    liked true
  end
end
