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

class Comment < ActiveRecord::Base
  belongs_to :note
end
