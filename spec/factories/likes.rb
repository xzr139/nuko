# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  note_id    :integer          not null
#  content    :string(255)      not null
#  deleted_at :datetime
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
