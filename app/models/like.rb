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
# Indexes
#
#  index_likes_on_note_id_and_comment_id_and_user_id  (note_id,comment_id,user_id)
#

class Like < ActiveRecord::Base
  belongs_to :comment
  belongs_to :user
  belongs_to :note

  validates :note_id, presence: true
  validates :comment_id, presence: true
  validates :user_id, presence: true
end
