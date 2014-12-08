# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  note_id    :integer          not null
#  comment_id :integer          not null
#  user_id    :integer          not null
#  liked      :boolean          default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#

class Like < ActiveRecord::Base
  belongs_to :comment
end
