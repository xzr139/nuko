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

class Like < ActiveRecord::Base
  belongs_to :comment

  validates :note_id, presence: true
  validates :comment_id, presence: true
  validates :user_id, presence: true
  validates :liked, presence: true
end
