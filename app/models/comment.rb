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

class Comment < ActiveRecord::Base
  include PublicActivity::Model

  belongs_to :note
  belongs_to :user
  has_many :likes

  validates :content, presence: true, length: { maximum: 2000 }

  acts_as_paranoid
end
