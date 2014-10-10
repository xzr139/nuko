# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  note_id    :integer
#  content    :string(255)
#  like_count :integer
#  deleted_at :datetime
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :note do
    content
    association(:user)
    association(:note)
  end
end
