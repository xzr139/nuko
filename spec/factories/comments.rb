# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  note_id    :integer          not null
#  content    :text(65535)      not null
#  deleted_at :datetime
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_comments_on_note_id  (note_id)
#  index_comments_on_user_id  (user_id)
#

FactoryGirl.define do
  factory :comment do
    sequence(:content) { |n| "content#{n}" }
    association(:user)
    association(:note)
  end
end
